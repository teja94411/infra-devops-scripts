#!/bin/bash

# Pull the Nginx image
docker pull nginx:latest

# Stop and remove any existing container
docker stop nginx_container
docker rm nginx_container

# Run a new Nginx container
docker run -d --name nginx_container -p 80:80 nginx:latest

# Check if the container is running
if [ $? -eq 0 ]; then
    echo "Nginx container deployed successfully." | mail -s "Docker Deployment Success" your-email@example.com
else
    echo "Failed to deploy Nginx container." | mail -s "Docker Deployment Failure" your-email@example.com
fi
