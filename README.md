# Homelab Kubernetes Learning Journey

Production-grade Kubernetes homelab built from scratch for learning DevOps/Platform Engineering skills.

## Infrastructure

- **Hypervisor:** Proxmox VE 9.1 on Dell OptiPlex 3080 Micro
- **Cluster:** 3-node k3s (1 control plane + 2 workers) in LXC containers
- **Networking:** Pi-hole for DNS and ad-blocking
- **Ingress:** Traefik for host-based routing
- **Storage:** Local-path provisioner for persistent volumes
- **Monitoring:** Prometheus + Grafana for observability
- **GitOps:** ArgoCD + Gitea for automated deployments
- **IaC:** Ansible for automation, Terraform for infrastructure provisioning

## What I've Built

### Phase 1: Foundation
- ✅ Proxmox virtualization environment
- ✅ Automated Pi-hole deployment via Ansible
- ✅ Network-wide ad blocking

### Phase 2: Kubernetes Cluster
- ✅ 3-node k3s cluster in LXC containers
- ✅ Overcame LXC/k3s compatibility (AppArmor, /dev/kmsg, /proc/sys)
- ✅ Multi-node pod scheduling and distribution

### Phase 3: Core Kubernetes Concepts
- ✅ Declarative deployments with YAML manifests
- ✅ Rolling updates and rollbacks
- ✅ Resource management (CPU/memory requests and limits)
- ✅ Self-healing infrastructure
- ✅ Git-based infrastructure version control

### Phase 4: Services & Networking
- ✅ ClusterIP and NodePort services
- ✅ Service discovery via DNS
- ✅ Multi-tier applications (frontend ↔ backend)
- ✅ Load balancing across pods

### Phase 5: Ingress & Routing
- ✅ Traefik ingress controller via Helm
- ✅ Host-based routing with clean URLs
- ✅ DNS integration with Pi-hole
- ✅ Production-grade traffic management

### Phase 6: Configuration Management
- ✅ ConfigMaps for application configuration
- ✅ Secrets for sensitive data
- ✅ Environment variables and volume mounts
- ✅ Live config updates without container rebuilds

### Phase 7: Persistent Storage & StatefulSets
- ✅ PersistentVolumes and PersistentVolumeClaims
- ✅ StatefulSets for stateful applications
- ✅ PostgreSQL database with persistent data
- ✅ Data persistence across pod restarts
- ✅ Production database deployment patterns

### Phase 8: Monitoring & Observability
- ✅ Prometheus metrics collection and storage
- ✅ Grafana dashboards and visualization
- ✅ Pre-built Kubernetes dashboards
- ✅ PostgreSQL monitoring with postgres-exporter
- ✅ Custom metrics and queries (PromQL)
- ✅ ServiceMonitor configuration
- ✅ Real-time resource monitoring
- ✅ Alert rules for cluster health

### Phase 9: CI/CD & GitOps
- ✅ Gitea Git server deployed in-cluster
- ✅ ArgoCD GitOps controller
- ✅ Automated deployments from Git
- ✅ Git as single source of truth
- ✅ Automatic sync and self-healing
- ✅ Declarative application management
- ✅ Audit trail via Git history
- ✅ Zero-touch deployments (push to Git → auto-deploy)

### Phase 10: Infrastructure as Code with Terraform
- ✅ Terraform for Proxmox automation
- ✅ Declarative infrastructure provisioning
- ✅ LXC container automation
- ✅ Reusable Terraform modules
- ✅ Infrastructure versioning in Git
- ✅ Reproducible environment creation
- ✅ State management and tracking
- ✅ Plan before apply workflow

## Skills Demonstrated

**Kubernetes:**
- Multi-replica deployments with self-healing
- Zero-downtime rolling updates
- Declarative infrastructure management
- Service discovery and networking
- Ingress controllers and routing
- ConfigMaps and Secrets management
- Persistent storage and StatefulSets
- Database deployment and management
- Production monitoring and observability
- GitOps workflow automation

**Infrastructure as Code:**
- Ansible playbooks for automation
- Terraform for infrastructure provisioning
- Git version control for infrastructure
- Declarative YAML manifests
- GitOps principles (Git as source of truth)
- Helm chart deployments
- Automated drift detection and remediation
- Reusable modules and abstraction
- State management

**CI/CD & GitOps:**
- ArgoCD application deployment
- Automated synchronization from Git
- Self-healing infrastructure
- Configuration drift prevention
- Rollback via Git revert
- Multi-application orchestration
- Repository-based deployment strategy

**Monitoring & Observability:**
- Prometheus metric collection
- Grafana dashboard creation
- PromQL query language
- ServiceMonitor configuration
- Database monitoring
- Resource tracking and alerting

**Production Operations:**
- Resource optimization
- High availability patterns
- Configuration externalization
- Security best practices (secrets management)
- Stateful application management
- Data persistence strategies
- Performance monitoring
- Capacity planning
- Troubleshooting and debugging
- Problem-solving in production-like environments
- Infrastructure reproducibility

## Repository Structure
```
.
├── ansible/
│   ├── pihole/          # Pi-hole deployment automation
│   └── k3s/             # k3s cluster provisioning
├── kubernetes/
│   ├── deployments/     # Application deployments
│   ├── services/        # Service definitions
│   ├── ingress/         # Ingress resources
│   ├── configmaps-secrets/  # Configuration management
│   ├── persistent-storage/  # StatefulSets and persistent volumes
│   └── monitoring/      # Prometheus + Grafana stack
├── gitops-example/
│   └── applications/    # GitOps-managed application manifests
│       ├── frontend/
│       ├── backend/
│       └── nginx/
└── terraform/
    ├── modules/
    │   └── lxc-k3s/     # Reusable k3s LXC container module
    ├── example-k3s-cluster.tf  # 3-node cluster example
    └── provider.tf.example     # Provider configuration template
```

## Tech Stack

- **Virtualization:** Proxmox VE, LXC
- **Infrastructure as Code:** Terraform, Ansible
- **Container Orchestration:** Kubernetes (k3s)
- **Configuration Management:** Ansible
- **Service Mesh:** Traefik
- **DNS:** Pi-hole, CoreDNS
- **Package Management:** Helm
- **Storage:** Local-path provisioner
- **Database:** PostgreSQL (StatefulSet)
- **Monitoring:** Prometheus, Grafana
- **Metrics:** Node Exporter, kube-state-metrics, postgres-exporter
- **GitOps:** ArgoCD
- **Git Server:** Gitea
- **Version Control:** Git

## Access Points

- **ArgoCD:** https://argocd.local:30801 (admin)
- **Gitea:** http://gitea.local:30030 (gitea_admin)
- **Grafana:** http://grafana.local:30300 (admin/admin123)
- **Prometheus:** http://prometheus.local:30901
- **Traefik Dashboard:** http://traefik.local:30090/dashboard/
- **Frontend App:** http://frontend.local:30090
- **Nginx Demo:** http://nginx.local:30090
- **Pi-hole:** http://192.168.1.149/admin

## GitOps Workflow

All applications are now managed via GitOps:

1. Make changes to YAML files in Git repository
2. Commit and push to Gitea
3. ArgoCD automatically detects changes
4. ArgoCD syncs cluster state to match Git
5. Applications update with zero manual intervention

**Deployed applications via ArgoCD:**
- backend-api
- frontend-web
- nginx-webapp

**Benefits:**
- Git is single source of truth
- Full audit trail of all changes
- Easy rollback (git revert)
- Automated drift detection
- Self-healing infrastructure
- No manual kubectl commands needed

## Terraform Workflow

Infrastructure provisioning automated with Terraform:

1. Define infrastructure in `.tf` files
2. `terraform plan` - preview changes
3. `terraform apply` - create/modify infrastructure
4. State tracked automatically
5. Reproducible environments

**Example use cases:**
- Provision LXC containers for k3s nodes
- Configure networking and storage
- Scale infrastructure up/down
- Destroy and recreate environments
- Version infrastructure in Git

## Monitoring Dashboards

**Pre-built Kubernetes Dashboards:**
- Kubernetes / Compute Resources / Cluster - Overall cluster health
- Kubernetes / Compute Resources / Namespace (Pods) - Per-namespace metrics
- Kubernetes / Compute Resources / Pod - Individual pod metrics
- Node Exporter / Nodes - Host-level system metrics

**Custom Metrics Available:**
- Container CPU and memory usage
- Network I/O rates
- Pod counts and status
- PostgreSQL connections and transactions
- Database size and performance
- Node resource utilization

## Key Learning Moments

**ConfigMap Pod Restart:** Discovered that updating ConfigMaps doesn't automatically restart pods - they continue running with old values until explicitly restarted with `kubectl rollout restart`.

**Terraform Privileged Containers:** Learned that creating privileged LXC containers with features (nesting, keyctl) requires `root@pam` authentication, not API tokens.

**LXC Minimal Installs:** LXC containers don't include SSH server by default - must be installed separately or accessed via Proxmox console.

## Next Steps

- [ ] Advanced alerting with Alertmanager
- [ ] Log aggregation (Loki + Promtail)
- [ ] Advanced networking (NetworkPolicies)
- [ ] Multi-environment GitOps (dev/staging/prod)
- [ ] Secrets management (Sealed Secrets / External Secrets)
- [ ] Backup automation (Velero)
- [ ] Service mesh (Istio/Linkerd)

## Learning Resources

Built through hands-on experimentation, documentation reading, and problem-solving. 

Every error message was a learning opportunity.

---

**Status:** Active learning project  
**Goal:** Build production-ready DevOps skills for job market  
**Current Phase:** 10 of 10 core phases complete ✅

**Journey Timeline:**
- Weeks 1-2: Foundation (Proxmox, k3s, core concepts)
- Weeks 3-4: Advanced features (storage, monitoring)
- Weeks 5-6: Automation (GitOps, Terraform)
