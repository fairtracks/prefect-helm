#!/usr/bin/env bash

helm uninstall prefect-worker prefect-server
kubectl delete pods --all --grace-period=0 --force
kubectl apply -f local_cluster_manifests/server.yaml
kubectl apply -f local_cluster_manifests/workera.yaml
kubectl apply -f local_cluster_manifests/workerb.yaml
helm install prefect-server charts/prefect-server
helm install prefect-worker charts/prefect-worker
kubectl get pods -o wide