#!/bin/bash

# Check if fixed-app is running
if [ $(docker inspect -f '{{.State.Running}}' fixed-app) != "true" ]; then
  exit 1
fi

# Check env var
if ! docker inspect fixed-app | grep -q "DB_HOST=localhost"; then
  exit 1
fi
