#!/bin/bash

# Check if happy-app is running
if [ $(docker inspect -f '{{.State.Running}}' happy-app) != "true" ]; then
  exit 1
fi

# Check env var
if ! docker inspect happy-app | grep -q "DB_HOST=correcthost"; then
  exit 1
fi
