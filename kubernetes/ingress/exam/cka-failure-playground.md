# CKA FAILURE PLAYGROUND

## Purpose

Practice real troubleshooting scenarios similar to CKA exam tasks.

## Method

1. Deploy broken resource
2. Observe failure
3. Diagnose with kubectl
4. Fix configuration

---

## Scenario 1 – Wrong Container Image

Broken deployment

apiVersion: apps/v1
kind: Deployment
metadata:
name: broken-nginx
spec:
replicas: 1
selector:
matchLabels:
app: broken-nginx
template:
metadata:
labels:
app: broken-nginx
spec:
containers:
- name: nginx
image: nginx:doesnotexist

Symptoms

kubectl get pods

ImagePullBackOff

Diagnosis

kubectl describe pod <pod>

Fix

kubectl set image deployment/broken-nginx nginx=nginx

---

## Scenario 2 – Service Selector Mismatch

Broken service

apiVersion: v1
kind: Service
metadata:
name: web-service
spec:
selector:
app: wronglabel
ports:

* port: 80
  targetPort: 80

Symptoms

Service exists but cannot reach pods.

Diagnosis

kubectl get pods --show-labels

Fix

Correct selector to match pod labels.

---

## Scenario 3 – Pod CrashLoop

Broken container command

containers:

* name: app
  image: nginx
  command: ["fakecommand"]

Symptoms

CrashLoopBackOff

Diagnosis

kubectl logs <pod>

Fix

Remove incorrect command.

---

## Scenario 4 – Pod Stuck Pending

Broken scheduling

spec:
nodeSelector:
disktype: ssd

Symptoms

Pod stuck in Pending state.

Diagnosis

kubectl describe pod

Shows:

0/3 nodes available

Fix

Label node

kubectl label node worker1 disktype=ssd

---

## Scenario 5 – Missing ConfigMap

Broken pod

envFrom:

* configMapRef:
  name: missing-config

Symptoms

Container fails to start.

Diagnosis

kubectl describe pod

Error shows missing configmap.

Fix

Create configmap.

---

## Scenario 6 – Secret Not Mounted

Pod references secret that doesn't exist.

Symptoms

Container startup failure.

Diagnosis

kubectl describe pod

Fix

kubectl create secret generic db-secret 
--from-literal=password=test123

---

## Scenario 7 – PVC Not Bound

Broken storage

persistentVolumeClaim:
claimName: data-pvc

Symptoms

Pod stuck Pending.

Diagnosis

kubectl get pvc

Shows Pending.

Fix

Create matching persistent volume.

---

## Scenario 8 – Network Policy Blocking Traffic

Policy denies traffic.

Symptoms

Pods cannot communicate.

Diagnosis

kubectl get networkpolicy

Fix

Allow ingress rule.

---

## Scenario 9 – Wrong Container Port

Service targetPort incorrect.

Symptoms

Service reachable but application fails.

Diagnosis

kubectl describe svc

Fix

Correct targetPort.

---

## Scenario 10 – Node Not Ready

Simulate node issue.

Symptoms

Pods reschedule or fail.

Diagnosis

kubectl get nodes
kubectl describe node

Fix

Investigate kubelet or reschedule workloads.

---

## DEBUGGING WORKFLOW

Always follow this order:

kubectl get pods
kubectl describe pod <pod>
kubectl logs <pod>
kubectl get events

Most problems become obvious by step 2.

---

## ADVANCED PRACTICE

Make practice harder by:

1. Setting time limits
2. Breaking multiple resources at once
3. Practicing fixes without documentation

---

## TARGET SKILL LEVEL

You should be able to diagnose and fix most issues in under 5 minutes.

If you can do that reliably, you are well prepared for the CKA exam.
