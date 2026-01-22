#!/bin/bash

# Check registry is up
if [ $(docker inspect -f '{{.State.Running}}' registry) != "true" ]; then
  exit 1
fi

# Check tag exists
if [ $(docker images -q localhost:5000/my-alpine | wc -l) -eq 0 ]; then
  exit 1
fi
