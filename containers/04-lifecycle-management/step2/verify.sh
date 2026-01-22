#!/bin/bash

# Check if time-machine exists
if ! docker inspect time-machine >/dev/null 2>&1; then
  exit 1
fi

# Ideally, we check if they unpaused it.
if [ $(docker inspect -f '{{.State.Paused}}' time-machine) == "true" ]; then
  echo "Container is still paused. Please unpause it."
  exit 1
fi

if [ $(docker inspect -f '{{.State.Running}}' time-machine) != "true" ]; then
   exit 1
fi
