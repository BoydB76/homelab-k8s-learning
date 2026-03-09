Before Exam

Prepare environment muscle memory.

Immediately run:

alias k=kubectl

and

source <(kubectl completion bash)
Use Kubernetes Documentation

Allowed domains include:

kubernetes.io

kubernetes.github.io

Use docs mainly for:

YAML examples

syntax reminders

Time Strategy

Exam time:

2 hours
~17 questions

Recommended approach:

5 minutes per task average

If a question takes longer than 7 minutes, skip it.

Return later.

Question Order Trick

Start with easy questions first.

Typical quick tasks:

create pod

scale deployment

expose service

These give quick points.

Troubleshooting Strategy

Always follow this order:

kubectl get pods
kubectl describe pod
kubectl logs pod
kubectl get events

90% of issues appear here.

YAML Strategy

Never write YAML from scratch.

Always generate template:

kubectl create deployment nginx --image=nginx --dry-run=client -o yaml

Edit it.

Biggest Time Saver

Use kubectl edit.

Example:

kubectl edit deployment web

Much faster than rewriting YAML.

Final Advice (From Experienced CKA Candidates)

The exam is mostly testing three skills:

kubectl speed
YAML editing
troubleshooting
