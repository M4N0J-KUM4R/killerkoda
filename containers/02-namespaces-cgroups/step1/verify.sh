#!/bin/bash

# Check if iso-test is running
if [ $(docker inspect -f '{{.State.Running}}' iso-test) != "true" ]; then
  exit 1
fi
