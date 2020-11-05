#!/bin/bash

ACTION=$1
STACK="capstone-project-kubernetes-node-group"
TEMPLATE="kubernetes-node-group.yaml"
PARAMS="parameters.json"

./execute.sh $ACTION $STACK $TEMPLATE $PARAMS