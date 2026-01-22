#!/bin/bash

# Check if target-app is running
if [ $(docker inspect -f '{{.State.Running}}' target-app) != "true" ]; then
  exit 1 
fi

# Check if the user created the confirmation file (simple check)
if [ ! -f shared.txt ]; then
  exit 1
fi
