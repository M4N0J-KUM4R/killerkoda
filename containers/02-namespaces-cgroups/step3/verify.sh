#!/bin/bash

# Check if target-app is running
if [ $(docker inspect -f '{{.State.Running}}' target-app) != "true" ]; then
  exit 1 
fi