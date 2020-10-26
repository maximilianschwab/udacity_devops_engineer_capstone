#!/usr/bin/env bash

# Step 1:
# Build image and add a descriptive tag
docker build --tag=udacity-devops-capstone .

# Step 2: 
# List docker images
docker image ls

# Step 3: 
# Run flask app
docker run --name udacity-devops-capstone -p 8080:8080 udacity-devops-capstone