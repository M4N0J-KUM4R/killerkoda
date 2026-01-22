#!/bin/bash

# Check if weak-container is running
if [ $(docker inspect -f '{{.State.Running}}' weak-container) != "true" ]; then
  exit 1
fi

# Check memory limit (10MB = 10485760 bytes)
MEM=$(docker inspect -f '{{.HostConfig.Memory}}' weak-container)
if [ "$MEM" != "10485760" ]; then
  exit 1
fi