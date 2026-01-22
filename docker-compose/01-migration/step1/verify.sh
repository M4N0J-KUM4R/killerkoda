#!/bin/bash

# Check if compose services are running
# Docker compose names containers as <project>_<service>_<index>
# Usually the directory name is the project name.
# But we can check specifically for the existence of the containers we know should exist.
# The `docker-compose.yml` specified names as keys, but didn't set `container_name`.
# So they will be mostly like `01-migration-redis-cache-1` or similar.

# Actually, the easiest way to check is using `docker compose ps` output parsing,
# OR just checking if ANY container with image nginx and redis is running attached to the network.

if [ $(docker ps -q --filter ancestor=redis | wc -l) -eq 0 ]; then exit 1; fi
if [ $(docker ps -q --filter ancestor=nginx | wc -l) -eq 0 ]; then exit 1; fi

# Check if they are on the same network
# We can check if 'docker compose ps' returns 2 services running
if [ $(docker compose ps -q | wc -l) -lt 2 ]; then exit 1; fi
