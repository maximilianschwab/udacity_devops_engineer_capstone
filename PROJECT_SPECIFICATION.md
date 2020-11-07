# Project specification according to Udacity project rubric

- [x] **Set up pipeline**
    - [x] Create Github repository with project code
        - All project code is stored in a GitHub repository and a link to the repository has been provided for reviewers.
    - [x] Use image repository to store Docker images
        - The project uses a centralized image repository to manage images built in the project. After a clean build, images are pushed to the repository.

- [x] **Build Docker container**
    - [x] Execute linting step in code pipeline
        - Code is checked against a linter as part of a Continuous Integration step (demonstrated w/ two screenshots)
    - [x] Build a Docker container in a pipeline
        - The project takes a Dockerfile and creates a Docker container in the pipeline.

- [x] **Successful Deployment**
    - [x] The Docker container is deployed to a Kubernetes cluster
        - The cluster is deployed with CloudFormation or Ansible. This should be in the source code of the student’s submission.
    - [x] Use Blue/Green Deployment or a Rolling Deployment successfully
        - The project performs the correct steps to do a blue/green or a rolling deployment into the environment selected. Student demonstrates the successful completion of chosen deployment methodology with screenshots.