#!/bin/bash

ACTION=$1
STACK="capstone-project-kubernetes-cluster"
TEMPLATE="kubernetes-cluster.yaml"
PARAMS="parameters.json"

./execute.sh $ACTION $STACK $TEMPLATE $PARAMS