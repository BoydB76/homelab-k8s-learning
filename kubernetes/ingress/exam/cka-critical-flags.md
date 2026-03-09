# CKA – 12 CRITICAL KUBECTL FLAGS AND YAML FIELDS

These flags and fields appear constantly in labs, tutorials,
and exam questions. Knowing them from memory saves significant time.

---

1. --dry-run=client

---

Used to generate YAML without creating resources.

Example

kubectl run nginx --image=nginx --dry-run=client -o yaml

Use this constantly during the exam to generate templates.

---

2. -o yaml

---

Outputs resource definitions in YAML.

Example

kubectl get pod nginx -o yaml

Useful for copying configuration fields into new resources.

---

3. --image

---

Specifies container image when creating pods or deployments.

Example

kubectl run nginx --image=nginx

---

4. --replicas

---

Defines number of pod replicas in a deployment.

Example

kubectl create deployment web --image=nginx --replicas=3

Also used when scaling.

kubectl scale deployment web --replicas=5

---

5. --namespace

---

Targets a specific namespace.

Example

kubectl get pods --namespace=dev

Or shorthand

kubectl -n dev get pods

---

6. --selector

---

Filters resources by labels.

Example

kubectl get pods --selector=app=nginx

Important for debugging service routing problems.

---

7. --port and --target-port

---

Used when exposing services.

Example

kubectl expose deployment web --port=80 --target-port=8080

Very common networking configuration.

---

8. metadata.name

---

Most important YAML field.

Example

metadata:
name: nginx-pod

Used in almost every resource.

---

9. metadata.labels

---

Labels connect resources together.

Example

metadata:
labels:
app: nginx

Services depend on label matching.

---

10. spec.selector

---

Defines which pods a service or deployment manages.

Example

selector:
matchLabels:
app: nginx

If this is wrong, services break.

---

11. spec.containers

---

Defines containers inside a pod.

Example

spec:
containers:

* name: nginx
  image: nginx

You will edit this section frequently.

---

12. spec.volumes and volumeMounts

---

Used for storage and config injection.

Example

spec:
containers:

* name: app
  volumeMounts:

  * mountPath: /data
    name: storage

volumes:

* name: storage
  persistentVolumeClaim:
  claimName: data-pvc

Common in storage and configmap scenarios.

---

## FAST YAML EDITING TIP

Instead of writing YAML manually:

1. Generate template

kubectl run nginx --image=nginx --dry-run=client -o yaml > pod.yaml

2. Edit file

3. Apply

kubectl apply -f pod.yaml

---

## COMMON LABEL PATTERN

Most examples use this structure.

metadata:
labels:
app: nginx

selector:
matchLabels:
app: nginx

---

## DEBUGGING CHECKLIST

When something fails during the exam:

1. kubectl get pods
2. kubectl describe pod
3. kubectl logs pod
4. kubectl get events

Most errors appear in describe output.

---

## KEY TAKEAWAY

You should practice until these actions feel automatic:

generate YAML
edit containers
fix labels/selectors
scale deployments
inspect logs
debug scheduling

Speed is the real skill tested in CKA.
