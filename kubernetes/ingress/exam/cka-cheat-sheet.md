# CKA COMMAND CHEAT SHEET

## Aliases

alias k=kubectl
source <(kubectl completion bash)

## Cluster

k get nodes
k describe node <node>

## Pods

Create pod
k run nginx --image=nginx

List pods
k get pods -A

Describe pod
k describe pod <pod>

View logs
k logs <pod>

Stream logs
k logs -f <pod>

Exec into pod
k exec -it <pod> -- /bin/sh

## Deployments

Create deployment
k create deployment web --image=nginx

Scale deployment
k scale deployment web --replicas=3

Update image
k set image deployment/web nginx=nginx:1.25

Check rollout
k rollout status deployment web

Rollback deployment
k rollout undo deployment web

## Services

Expose deployment
k expose deployment web --port=80 --type=ClusterIP

NodePort service
k expose deployment web --port=80 --type=NodePort

List services
k get svc

## Config

Create configmap
k create configmap app-config --from-literal=env=prod

Create secret
k create secret generic db-secret --from-literal=password=1234

## Namespaces

List namespaces
k get ns

Switch namespace
k config set-context --current --namespace=dev

## Storage

List persistent volumes
k get pv

List persistent volume claims
k get pvc

## Troubleshooting

Check events
k get events

Describe resource
k describe pod <pod>

Check everything
k get all

Watch resources
k get pods -w

## YAML Shortcuts

Generate YAML
k run nginx --image=nginx --dry-run=client -o yaml

Deployment YAML
k create deployment nginx --image=nginx --dry-run=client -o yaml

Export existing YAML
k get pod nginx -o yaml

## Node Maintenance

Drain node
k drain node01 --ignore-daemonsets

Uncordon node
k uncordon node01

Cordon node
k cordon node01
