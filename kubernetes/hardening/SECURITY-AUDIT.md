# Infrastructure Security Audit & Hardening

**Date:** 2026-03-29
**Scope:** homelab-k8s Kubernetes cluster

---

## Findings & Remediations

### CRITICAL: Hardcoded secrets

| Location | Issue | Fix |
|---|---|---|
| `persistent-storage/postgres-statefulset.yaml` | `POSTGRES_PASSWORD: "mysecretpassword"` in plaintext | Replaced with `secretKeyRef` to `postgres-credentials` Secret |
| `monitoring/postgres-exporter.yaml` | Full DB connection string with password in `value:` | Replaced with `secretKeyRef` to `postgres-exporter-credentials` Secret |

**Action required:** Before applying manifests, generate real passwords and update the placeholder Secrets in `hardening/postgres-secret.yaml` and `hardening/postgres-exporter-secret.yaml`. Use a secrets manager (Vault, Sealed Secrets, SOPS) for production.

---

### HIGH: No namespace separation

All workloads were running in `default`. Added three purpose-built namespaces:

| Namespace | Purpose |
|---|---|
| `apps` | frontend, backend, nginx workloads |
| `data` | PostgreSQL StatefulSet |
| `monitoring` | Prometheus, Grafana, postgres-exporter |

Apply: `kubectl apply -f kubernetes/hardening/namespaces/namespaces.yaml`

---

### HIGH: No RBAC

No ServiceAccounts or Roles existed. Added:

- `apps` namespace: `frontend-sa`, `backend-sa` with minimal ConfigMap read permissions
- `data` namespace: `postgres-sa` (no API access); Role granting monitoring SA read access to `postgres-credentials` Secret
- `monitoring` namespace: `postgres-exporter-sa`

Apply: `kubectl apply -f kubernetes/hardening/rbac/`

---

### HIGH: No NetworkPolicies

Default-allow posture — any pod could reach any other pod. Added default-deny + allow rules:

- **apps namespace**: allow Traefik ingress → frontend/backend/nginx; allow backend → postgres (data namespace)
- **data namespace**: allow apps and monitoring → postgres on port 5432 only
- **monitoring namespace**: allow Prometheus scrape → exporters; allow Grafana → Prometheus

Apply: `kubectl apply -f kubernetes/hardening/network-policies/`

---

### MEDIUM: Traefik dashboard exposed over HTTP

`traefik-dashboard-ingress.yaml` used `entrypoints: web` with no TLS. Updated to:
- `entrypoints: websecure` with `router.tls: "true"`
- `tls.secretName: traefik-dashboard-tls` (supply cert via cert-manager or static Secret)
- `traefik-dashboard-auth@kubernetescrd` middleware for basic auth protection

Apply: `kubectl apply -f kubernetes/hardening/traefik-https-redirect.yaml`

**Action required:** Create `traefik-dashboard-auth-secret` Secret with htpasswd users entry.

---

### MEDIUM: All ingresses HTTP-only

`nginx-ingress.yaml` and `frontend-ingress.yaml` used `entrypoints: web`. Updated to `websecure` with TLS annotation and HTTPS redirect middleware.

---

### LOW: No container security contexts

Updated `postgres-statefulset.yaml` and `postgres-exporter.yaml` with:
- `runAsNonRoot: true`
- `allowPrivilegeEscalation: false`
- `capabilities.drop: [ALL]`
- Resource limits added to all containers

---

## Apply Order

```bash
# 1. Namespaces first
kubectl apply -f kubernetes/hardening/namespaces/namespaces.yaml

# 2. Secrets (update placeholders first!)
kubectl apply -f kubernetes/hardening/postgres-secret.yaml
kubectl apply -f kubernetes/hardening/postgres-exporter-secret.yaml

# 3. RBAC
kubectl apply -f kubernetes/hardening/rbac/

# 4. Traefik middlewares
kubectl apply -f kubernetes/hardening/traefik-https-redirect.yaml

# 5. Network policies
kubectl apply -f kubernetes/hardening/network-policies/

# 6. Updated workloads
kubectl apply -f kubernetes/persistent-storage/postgres-statefulset.yaml
kubectl apply -f kubernetes/monitoring/postgres-exporter.yaml
kubectl apply -f kubernetes/ingress/
```

## Remaining Recommendations (Future Work)

- **Secrets management**: Integrate [Sealed Secrets](https://github.com/bitnami-labs/sealed-secrets) or HashiCorp Vault for GitOps-safe secret storage
- **cert-manager**: Deploy cert-manager with a self-signed or ACME issuer for `*.local` TLS certs
- **PodSecurityAdmission**: Enforce `restricted` or `baseline` PSA policy on `apps` and `monitoring` namespaces
- **Audit logging**: Enable k3s audit log to file for API server activity
- **Image pinning**: Replace `:latest` tags with pinned digest references
