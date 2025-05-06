#!/bin/bash

# Load environment variables from .env file
export $(cat /path/to/.env | xargs)

# Pull the Docker image
docker pull your_image:latest

# Stop and remove any existing container
docker stop your_container
docker rm your_container

# Run the container with environment variables
docker run -d --name your_container -p 80:80 --env-file /path/to/.env your_image:latest

# Check if the container is running
if [ $? -eq 0 ]; then
    echo "Docker container deployed with environment variables." | mail -s "Docker Deployment Success" your-email@example.com
else
    echo "Docker container deployment failed." | mail -s "Docker Deployment Failure" your-email@example.com
fi
