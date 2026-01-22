#!/bin/bash

# Check if web1 is running
if [ $(docker inspect -f '{{.State.Running}}' web1) != "true" ]; then
  exit 1
fi

# Check if web2 is running
if [ $(docker inspect -f '{{.State.Running}}' web2) != "true" ]; then
  exit 1
fi

# Check web2 port mapping (HostPort should be 9090)
PORT=$(docker inspect -f '{{(index (index .NetworkSettings.Ports "80/tcp") 0).HostPort}}' web2)
if [ "$PORT" != "9090" ]; then
  exit 1
fi
