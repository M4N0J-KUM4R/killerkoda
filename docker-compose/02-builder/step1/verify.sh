#!/bin/bash

# Check if app.py exists
if [ ! -f app.py ]; then exit 1; fi

# Check if Dockerfile exists
if [ ! -f Dockerfile ]; then exit 1; fi

# Check if docker-compose.yml exists and has build context
if ! grep "build:" docker-compose.yml; then exit 1; fi

# Ideally we check if they ran it, but that's hard to persist unless checking image cache.
# We can check if an image with the project name exists. 
# Usually <project>_my-app
if [ $(docker images | grep my-app | wc -l) -eq 0 ]; then exit 1; fi
