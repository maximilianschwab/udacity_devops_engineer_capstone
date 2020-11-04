#!/bin/bash

ACTION=$1

case $ACTION in

  create)
    aws cloudformation create-stack \
    --stack-name $2 \
    --template-body file://$3 \
    --parameters file://$4 \
    --region=us-west-2 \
    --capabilities CAPABILITY_NAMED_IAM
    ;;

  delete)
    aws cloudformation delete-stack \
    --stack-name $1
    ;;

  update)
    aws cloudformation update-stack \
    --stack-name $2 \
    --template-body file://$3 \
    --parameters file://$4
    ;;

  *)
    echo -n "argument is unknown. expected arguments are (create | delete | update)"
    ;;
esac