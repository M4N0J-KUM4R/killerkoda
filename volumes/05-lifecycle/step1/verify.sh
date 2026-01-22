#!/bin/bash

# Check rule file
if ! grep -q "RECREATE" lifecycle_rule.txt; then exit 1; fi

# Check if container has the volume
if ! docker inspect forgetful-app | grep -q "/data"; then exit 1; fi

# Check if file was copied via docker cp
if ! docker exec forgetful-app ls /data/slip.txt; then exit 1; fi
