#!/bin/bash

echo "Enter the organisation name:"
read NAME
export NAME=$NAME
envsubst < namespaces/namespace.yml | kubectl delete -f -