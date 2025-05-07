# 🐳 Docker Commands Cheat Sheet — With Simple Definitions

## 📦 IMAGES
docker pull <image>                          # Download an image from Docker Hub

docker images                                # List all local images

docker rmi <image-id>                        # Remove a local image

docker build -t <name>:<tag> .               # Build image from Dockerfile

# 🏃‍♂️ CONTAINERS
docker run <image>                           # Run a container from an image

docker run -it <image>                       # Run interactively with terminal

docker run -d <image>                        # Run in background (detached mode)

docker run --name <container-name> <image>   # Run with a custom name

docker start <container>                     # Start a stopped container

docker stop <container>                      # Stop a running container

docker restart <container>                   # Restart a container

docker rm <container>                        # Remove a stopped container

docker ps                                    # List running containers

docker ps -a                                 # List all containers

docker exec -it <container> /bin/bash        # Open shell in a running container

docker logs <container>                      # View logs of a container

# 🛠 VOLUMES
docker volume create <name>                  # Create a named volume

docker volume ls                             # List all volumes

docker volume rm <name>                      # Delete a volume

docker run -v <volume-name>:/path/in/container <image>  # Mount volume

# 🌐 NETWORKING
docker network ls                            # List Docker networks

docker network create <name>                 # Create a custom network

docker network rm <name>                     # Remove a network

docker run --network=<name> <image>          # Attach container to a network

# 📄 DOCKERFILE
docker build -f Dockerfile -t <name>:<tag> . # Build from a specific Dockerfile

docker history <image>                       # Show Dockerfile commands used to build image

# 🐋 DOCKER COMPOSE
docker-compose up                            # Start services defined in docker-compose.yml

docker-compose up -d                         # Start in detached mode

docker-compose down                          # Stop and remove containers/networks

docker-compose ps                            # List running services

docker-compose logs                          # Show logs for services

# 🧹 CLEANUP
docker system prune                          # Remove unused data (containers, images, volumes)

docker container prune                       # Remove all stopped containers

docker image prune                           # Remove unused images

docker volume prune                          # Remove unused volumes

docker network prune                         # Remove unused networks

# 🔍 INSPECT & INFO
docker inspect <container/image>             # Detailed information (JSON output)

docker stats                                  # Real-time resource usage of containers

docker info                                   # Info about Docker installation

# 🔐 LOGIN / PUSH / PULL (Docker Hub)
docker login                                  # Log in to Docker Hub

docker tag <image> username/image:tag         # Tag image for Docker Hub

docker push username/image:tag                # Push to Docker Hub

docker pull username/image:tag                # Pull from Docker Hub

```
