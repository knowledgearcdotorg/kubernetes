#!/bin/bash
RED='\033[1;31m'
NC='\033[0m'

echo "Enter the organisation to delete:"
read NAME
export NAME=$NAME
echo -e "${RED}Confirm delete [y/n]:${NC}"
read y
if [ $y == 'y' ];
then
    envsubst < namespaces/namespace.yml | kubectl delete -f -
else
    echo "Aborting.."
    exit 0