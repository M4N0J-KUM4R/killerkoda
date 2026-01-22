#!/bin/bash
# Clean up
docker rm -f $(docker ps -aq) 2>/dev/null

# Create a "crashing" container that prints a secret error
docker run -d --name crashing-app alpine sh -c "echo 'CRITICAL ERROR: Database Connection Failed'; exit 1"

# Create a "misconfigured" container (wrong env var)
docker run -d --name confused-app -e DB_HOST=wronghost alpine sleep infinity
