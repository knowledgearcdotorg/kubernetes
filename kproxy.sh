#!/bin/bash

# get name of grafana pod
# pod=`kubectl get pods -o json -l k8s-app=grafana --all-namespaces | jq -r '.items[0].metadata.name'`

# and run the kube proxy so that we can access the kubernetes dashboard
# at http://localhost:8001/

echo Proxying to Kube Admin Dashboard at http://localhost:8001/ui
kubectl proxy &

open http://localhost:8001/ui

# Port forward to grafana
# kubectl port-forward $pod --namespace=kube-system 3002:3000 &
