#!/bin/bash
set -e

echo "Logging into Amazon ECR..."
aws ecr get-login-password --region ap-south-1 | docker login --username AWS --password-stdin 830975877324.dkr.ecr.ap-south-1.amazonaws.com

echo "Pulling Docker image..."
docker pull 830975877324.dkr.ecr.ap-south-1.amazonaws.com/reactapp/image

echo "Stopping and removing old containers..."
docker stop my-react-app || true
docker rm my-react-app || true

echo "Starting new container..."
docker run -d -p 80:80 --name my-react-app 830975877324.dkr.ecr.ap-south-1.amazonaws.com/reactapp/image

echo "Container started successfully."
