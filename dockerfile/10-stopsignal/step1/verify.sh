#!/bin/bash

# Check if app-signal exists
if [ $(docker images -q app-signal | wc -l) -eq 0 ]; then
  exit 1
fi

# Check if logs contain the specific message
if ! docker logs polite-app 2>&1 | grep -q "Received SIGUSR1"; then
  exit 1
fi
