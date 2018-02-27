#!/usr/bin/env bash
kubectl create -f api-service.yaml
kubectl create -f catalyst-service.yaml
kubectl create -f orchestrator-service.yaml
kubectl create -f rethink-service.yaml
kubectl create -f rethink-shard-service.yaml
kubectl create -f web-service.yaml
kubectl create -f api-deployment.yaml
kubectl create -f catalyst-deployment.yaml
kubectl create -f orchestrator-deployment.yaml
kubectl create -f rethink-deployment.yaml
kubectl create -f rethink-shard-deployment.yaml
kubectl create -f cion-persistentvolumeclaim.yaml
kubectl create -f web-deployment.yaml
kubectl create -f worker-pod.yaml
