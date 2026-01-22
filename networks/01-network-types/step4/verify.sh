#!/bin/bash
# Check if swarm is active and service exists
if ! docker service inspect mesh-app >/dev/null 2>&1; then exit 1; fi
