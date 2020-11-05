#!/bin/bash

ACTION=$1
STACK="capstone-project-jenkins-install"
TEMPLATE="jenkins-install.yaml"
PARAMS="parameters.json"

./execute.sh $ACTION $STACK $TEMPLATE $PARAMS