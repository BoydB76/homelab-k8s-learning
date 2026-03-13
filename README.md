# Homelab Kubernetes Learning Journey

Production-grade Kubernetes homelab built from scratch for learning DevOps/Platform Engineering skills.

## Infrastructure

- **Hypervisor:** Proxmox VE 9.1 on Dell OptiPlex 3080 Micro
- **Cluster:** 3-node k3s (1 control plane + 2 workers) in LXC containers
- **Networking:** Pi-hole for DNS and ad-blocking
- **Ingress:** Traefik for host-based routing
- **Storage:** Local-path provisioner for persistent volumes
- **Monitoring:** Prometheus + Grafana for observability
- **IaC:** Ansible for automation

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

**Infrastructure as Code:**
- Ansible playbooks for automation
- Git version control for infrastructure
- Declarative YAML manifests
- GitOps principles
- Helm chart deployments

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

## Repository Structure
```
.
├── ansible/
│   ├── pihole/          # Pi-hole deployment automation
│   └── k3s/             # k3s cluster provisioning
└── kubernetes/
    ├── deployments/     # Application deployments
    ├── services/        # Service definitions
    ├── ingress/         # Ingress resources
    ├── configmaps-secrets/  # Configuration management
    ├── persistent-storage/  # StatefulSets and persistent volumes
    └── monitoring/      # Prometheus + Grafana stack
```

## Tech Stack

- **Virtualization:** Proxmox VE, LXC
- **Container Orchestration:** Kubernetes (k3s)
- **Configuration Management:** Ansible
- **Service Mesh:** Traefik
- **DNS:** Pi-hole, CoreDNS
- **Package Management:** Helm
- **Storage:** Local-path provisioner
- **Database:** PostgreSQL (StatefulSet)
- **Monitoring:** Prometheus, Grafana
- **Metrics:** Node Exporter, kube-state-metrics, postgres-exporter
- **Version Control:** Git

## Access Points

- **Grafana:** http://grafana.local:30300 (admin/admin123)
- **Prometheus:** http://prometheus.local:30901
- **Traefik Dashboard:** http://traefik.local:30090/dashboard/
- **Frontend App:** http://frontend.local:30090
- **Nginx Demo:** http://nginx.local:30090
- **Pi-hole:** http://192.168.1.149/admin

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

## Next Steps

- [ ] CI/CD pipeline (ArgoCD or Flux)
- [ ] Advanced alerting with Alertmanager
- [ ] Terraform for infrastructure provisioning
- [ ] Additional application monitoring
- [ ] Log aggregation (Loki)
- [ ] Advanced networking (NetworkPolicies)

## Learning Resources

Built through hands-on experimentation, documentation reading, and problem-solving. 

Every error message was a learning opportunity.

---

**Status:** Active learning project  
**Goal:** Build production-ready DevOps skills for job market
