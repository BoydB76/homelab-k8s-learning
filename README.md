# Homelab Kubernetes Learning Journey

Production-grade Kubernetes homelab built from scratch for learning DevOps/Platform Engineering skills.

## Infrastructure

- **Hypervisor:** Proxmox VE 9.1 on Dell OptiPlex 3080 Micro
- **Cluster:** 3-node k3s (1 control plane + 2 workers) in LXC containers
- **Networking:** Pi-hole for DNS and ad-blocking
- **Ingress:** Traefik for host-based routing
- **Storage:** Local-path provisioner for persistent volumes
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

**Infrastructure as Code:**
- Ansible playbooks for automation
- Git version control for infrastructure
- Declarative YAML manifests
- GitOps principles

**Production Operations:**
- Resource optimization
- High availability patterns
- Configuration externalization
- Security best practices (secrets management)
- Stateful application management
- Data persistence strategies
- Monitoring and debugging
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
    └── persistent-storage/  # StatefulSets and persistent volumes
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
- **Version Control:** Git

## Next Steps

- [ ] Monitoring stack (Prometheus + Grafana)
- [ ] CI/CD pipeline (ArgoCD or Flux)
- [ ] Production application deployment
- [ ] Terraform for infrastructure provisioning
- [ ] Advanced networking (NetworkPolicies)

## Learning Resources

Built through hands-on experimentation, documentation reading, and problem-solving. 

Every error message was a learning opportunity.

---

**Status:** Active learning project  
**Goal:** Build production-ready DevOps skills for job market
