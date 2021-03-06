#!/bin/bash
GREEN='\033[1;32m'

read -p "Enter the organisation name: " NAME
export NAME=$NAME
echo -e "${GREEN}"
envsubst < namespaces/namespace.yml | kubectl apply -f -
PASSWORD=`openssl rand -hex 16 | base64 | tr -d "\n"` envsubst < secrets/postgres.txt |  kubectl apply -f -
envsubst < secrets/aws.yml | kubectl apply -f -
envsubst < services/postgres.yml | kubectl apply -f -
envsubst < services/dspace.yml | kubectl apply -f -
envsubst < statefulsets/postgres.yml | kubectl apply -f -
envsubst < statefulsets/dspace.yml | kubectl apply -f -