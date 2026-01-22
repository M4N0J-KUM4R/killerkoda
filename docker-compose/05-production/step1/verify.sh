#!/bin/bash

# Check compose file for restart: always
if ! grep "restart: always" docker-compose.yml; then exit 1; fi

# Check limits
if ! grep "limits:" docker-compose.yml; then exit 1; fi

# Check if 3 containers are running for this service
# Filtering by label com.docker.compose.service=worker
if [ $(docker ps -q --filter label=com.docker.compose.service=worker | wc -l) -lt 3 ]; then exit 1; fi
