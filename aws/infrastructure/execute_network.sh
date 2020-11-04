#!/bin/bash

ACTION=$1
STACK="capstone-project-network"
TEMPLATE="network.yaml"
PARAMS="parameters.json"

./execute.sh $ACTION $STACK $TEMPLATE $PARAMS