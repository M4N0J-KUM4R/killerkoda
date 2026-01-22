#!/bin/bash

# Check network
if ! docker network inspect auth-net >/dev/null 2>&1; then exit 1; fi

# Check instances
if [ $(docker ps -q -f name=auth-1 | wc -l) -eq 0 ]; then exit 1; fi
if [ $(docker ps -q -f name=auth-2 | wc -l) -eq 0 ]; then exit 1; fi

# Check alias usage (by inspecting one container)
if ! docker inspect auth-1 | grep "auth-svc"; then exit 1; fi
