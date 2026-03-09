# CKA STUDY NOTES – QUICK REFERENCE

## Background

The Certified Kubernetes Administrator (CKA) exam is a 2-hour hands-on lab exam.
You work in a terminal with kubectl against live clusters.

Passing score: ~66%

Main domains:

* Troubleshooting (~30%)
* Cluster architecture (~25%)
* Networking (~20%)
* Workloads & scheduling (~15%)
* Storage (~10%)

Speed and troubleshooting ability matter more than theory.

---

## TOP 20 CKA TASKS TO PRACTICE

1. List cluster nodes
   kubectl get nodes -o wide

2. Inspect node details
   kubectl describe node node01

3. Drain node for maintenance
   kubectl drain node01 --ignore-daemonsets

4. Allow scheduling again
   kubectl uncordon node01

5. Create a pod
   kubectl run nginx --image=nginx

6. Generate pod YAML quickly
   kubectl run nginx --image=nginx --dry-run=client -o yaml > pod.yaml

7. Check pod logs
   kubectl logs podname
   kubectl logs -f podname

8. Execute command inside container
   kubectl exec -it podname -- /bin/sh

9. Inspect pod errors
   kubectl describe pod podname

10. Create deployment
    kubectl create deployment web --image=nginx

11. Scale deployment
    kubectl scale deployment web --replicas=5

12. Update container image
    kubectl set image deployment/web nginx=nginx:1.25

13. Rollback deployment
    kubectl rollout undo deployment web

14. Monitor rollout
    kubectl rollout status deployment web

15. Expose deployment
    kubectl expose deployment web --port=80 --type=ClusterIP

16. Create NodePort service
    kubectl expose deployment web --type=NodePort --port=80

17. Test cluster DNS
    kubectl run test --image=busybox -it --rm -- nslookup kubernetes

18. Create ConfigMap
    kubectl create configmap app-config --from-literal=env=prod

19. Create Secret
    kubectl create secret generic db-secret --from-literal=password=1234

20. Create ServiceAccount + RBAC
    kubectl create serviceaccount app-sa
    kubectl create role pod-reader --verb=get,list --resource=pods
    kubectl create rolebinding read-pods --role=pod-reader --serviceaccount=default:app-sa

---

## KUBECTL COMMANDS TO MEMORIZE

Create kubectl alias
alias k=kubectl

Enable completion
source <(kubectl completion bash)

Generate YAML quickly
kubectl create deployment nginx --image=nginx --dry-run=client -o yaml

Generate pod YAML
kubectl run nginx --image=nginx --dry-run=client -o yaml

Export existing object YAML
kubectl get pod nginx -o yaml

Edit resource live
kubectl edit deployment web

Delete resource
kubectl delete pod nginx

Watch resources update
kubectl get pods -w

Show all resources
kubectl get all

Switch namespace
kubectl config set-context --current --namespace=dev

Check cluster events
kubectl get events

---

## 60 DAY CKA STUDY PLAN

Phase 1 (Days 1-10)
Learn Kubernetes architecture

Topics

* control plane
* scheduler
* kubelet
* etcd
* pods
* deployments
* services

Lab
deploy nginx
scale pods
delete pods
observe restart behaviour

Phase 2 (Days 11-25)
Workloads and deployments

Practice

* create pods
* create deployments
* update images
* rollout rollback
* readiness/liveness probes

Lab
break deployment image
fix crashloop

Phase 3 (Days 26-40)
Networking

Topics

* services
* cluster DNS
* ingress
* network policies

Labs
deploy two apps
connect via service
test DNS resolution

Phase 4 (Days 41-50)
Storage and security

Topics

* persistent volumes
* persistent volume claims
* storage classes
* RBAC
* service accounts

Lab
create PVC
mount into pod

Phase 5 (Days 51-60)
Troubleshooting focus

Practice scenarios

* pod stuck pending
* DNS failure
* wrong container image
* service misconfiguration
* node unavailable

---

## 15 COMMON CKA TROUBLESHOOTING SCENARIOS

1. Pod stuck Pending
   Often node selector or resource issue

2. CrashLoopBackOff
   Check logs for container error

3. ImagePullBackOff
   Incorrect container image

4. DNS lookup failing
   Check CoreDNS pods

5. Service not reachable
   Check selector labels

6. Deployment not updating
   Check rollout status

7. Node NotReady
   Inspect kubelet or node conditions

8. Persistent volume not binding
   Check storage class or capacity

9. Network policy blocking traffic
   Check ingress/egress rules

10. Pod scheduling failure
    Check taints and tolerations

11. Container port mismatch
    Service targetPort wrong

12. Secret not mounted
    Volume mount misconfigured

13. ConfigMap not loaded
    Env variable or volume issue

14. etcd backup restore required
    Admin task

15. Resource limits too low
    Pod OOMKilled

---

## CKA HOMELAB EXAM SIMULATOR

Create small cluster

control-plane
worker1
worker2

Tools
kubectl
helm
k9s

Example lab tasks

Task 1
Deploy nginx with 3 replicas

Task 2
Expose nginx via NodePort

Task 3
Break deployment image

Task 4
Fix crashloop

Task 5
Create ConfigMap and mount it

Task 6
Create service account and RBAC

Task 7
Create persistent volume and PVC

Task 8
Test internal DNS resolution

---

## WHY PEOPLE FAIL CKA

1. Working too slowly

2. Not knowing kubectl shortcuts

3. Spending too long debugging one problem

4. Not using kubernetes documentation efficiently

5. Poor YAML editing speed

6. No troubleshooting practice

---

## DAILY PRACTICE ROUTINE

30-60 minutes per day

5 minutes
review commands

20 minutes
deploy and modify workloads

20 minutes
break and troubleshoot pods

---

## KEY SUCCESS FACTOR

The CKA exam rewards:

speed
kubectl familiarity
debugging ability

If you can complete most labs in under 5 minutes,
you are well prepared.
