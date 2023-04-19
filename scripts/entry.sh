#!/bin/sh

# Create initialzed secret before starting k3s
/scripts/initial-scripts.sh

/bin/k3s $1
