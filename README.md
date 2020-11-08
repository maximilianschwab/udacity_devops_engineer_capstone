# Udacity DevOps Engineer Capstone Project

## REST API that calculates the sum of two integer numbers and returns the result

### Description
The capstone project for my Udacity course is about a micro service application with a rolling deployment via Kubernetes in combination with Jenkins, CloudFormation, EKS and my own tiny app which exposes a REST API to sum up two integers via a POST request.

The Jenkins CI/CD pipeline executes the following stages:
- Linting the Dockerfile
- Build the Dockerfile
- Push the Dockerfile to Docker Hub
- Print the kubectl config
- Print the kubectl context
- Print the AWS CLI config
- Apply the deployment to the Kubernetes cluster
- Update the deployment in the Kubernetes cluster
- Wait for the Kubernetes Pods to come up
- Check if the Kubernetes service is running

The infrastructure like network, EKS and so on are built via CloudFormation. The scripts for the differnet CloudFormation stacks can be found in the different folders of the aws folder.

The Docker image can be found on Docker Hun under the following URL https://hub.docker.com/r/maximilianschwab/devops_capstone

Or simply run `docker pull maximilianschwab/devops_capstone` to run the micro service locally in Docker.