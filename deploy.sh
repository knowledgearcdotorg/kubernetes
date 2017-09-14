#!/bin/bash

echo "Enter the organisation name:"
read NAME
export NAME=$NAME
envsubst < namespaces/namespace.yml | kubectl apply -f -
PASSWORD=`openssl rand -hex 16 | base64 | tr -d "\n"` envsubst < secrets/postgres.txt |  kubectl apply -f -
envsubst < secrets/aws.yml | kubectl apply -f -
envsubst < services/postgres.yml | kubectl apply -f -
envsubst < services/dspace.yml | kubectl apply -f -
envsubst < statefulsets/postgres.yml | kubectl apply -f -
envsubst < statefulsets/dspace.yml | kubectl apply -f -