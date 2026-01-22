#!/bin/bash
 
# Check if container named 'my-web-server' is running
if [ $(docker inspect -f '{{.State.Running}}' my-web-server) != "true" ]; then
  exit 1
fi
