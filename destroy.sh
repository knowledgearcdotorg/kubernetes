#!/bin/bash
RED='\033[1;31m'
NC='\033[0m'
GREEN='\033[1;32m'
 
read -p "Enter the organisation to delete:" NAME
export NAME=$NAME
echo -e "${RED}Are you sure you want to delete this (y/n)?${NC}"
read y
echo -e "${GREEN}"
if [ $y == 'y' ];
then
    envsubst < namespaces/namespace.yml | kubectl delete -f -
else
    echo "Aborting.."
    exit 0
fi