#!/bin/bash

# Check network
if ! docker network inspect backend >/dev/null 2>&1; then exit 1; fi

# Check DB
if [ $(docker ps -q -f name=redis-db | wc -l) -eq 0 ]; then exit 1; fi

# Check App connection
if ! docker exec web-app ping -c 1 redis-db; then exit 1; fi
