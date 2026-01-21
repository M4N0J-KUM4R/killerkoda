#!/bin/bash
# Install docker-compose if not present (usually involved in standard environments, but good to be safe)
apt-get update && apt-get install -y docker-compose
# Clean
docker-compose down 2>/dev/null
