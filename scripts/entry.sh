#!/bin/sh

# Create initialzed secret before starting k3s
#/scripts/initial-secrets.sh

echo "### DEBUG [$1] ###"
/bin/k3s $1
