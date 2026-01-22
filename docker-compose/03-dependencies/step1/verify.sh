#!/bin/bash

# Check if docker-compose.yml has condition: service_healthy
if ! grep "condition: service_healthy" docker-compose.yml; then exit 1; fi

# Check if ran
if [ $(docker ps -a -q --filter ancestor=redis | wc -l) -eq 0 ]; then exit 1; fi
