#!/bin/bash

# add node taint tolerations to deployed pods
kubectl patch deployment coredns --namespace=kube-system --type=json --patch='[{"op": "add", "path": "/spec/template/spec/tolerations/0", "value": { "key" : "dirac.washington.edu/instance-name", "value" : "t3-medium", "operator" : "Equal", "effect" : "NoSchedule"}}]'

# add nodeSelector
kubectl patch deployment coredns --namespace=kube-system --type=json --patch='[{"op": "add", "path": "/spec/template/spec/nodeSelector", "value": { "dirac.washington.edu/instance-name" : "t3-medium"}}]'

