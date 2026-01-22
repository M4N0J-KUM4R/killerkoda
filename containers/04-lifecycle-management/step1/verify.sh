#!/bin/bash

# Check if born-ready is running
if [ $(docker inspect -f '{{.State.Running}}' born-ready) != "true" ]; then
  exit 1
fi
