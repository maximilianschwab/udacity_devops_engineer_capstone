aws cloudformation create-stack \
--stack-name "capstone-project-user-credentials" \
--template-body file://credentials.yaml \
--region=us-west-2 \