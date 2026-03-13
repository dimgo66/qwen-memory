# Docker Skill

## Description
Docker containerization skill for building, running, and managing containers.

## Commands
```bash
# Container management
docker ps
docker ps -a
docker stop <container>
docker start <container>
docker rm <container>

# Image management
docker images
docker build -t <name> .
docker rmi <image>

# Run containers
docker run -d -p <host>:<container> <image>
docker run --rm -it <image> bash

# Logs and exec
docker logs <container>
docker exec -it <container> bash

# Docker Compose
docker-compose up -d
docker-compose down
docker-compose logs -f
```

## Usage
Use this skill for Docker container operations, image builds, and Compose management.
