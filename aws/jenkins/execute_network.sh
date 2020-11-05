#!/bin/bash

ACTION=$1
STACK="capstone-project-jenkins-network"
TEMPLATE="jenkins-network.yaml"
PARAMS="parameters.json"

./execute.sh $ACTION $STACK $TEMPLATE $PARAMS