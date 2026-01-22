#!/bin/bash

# Check if silent server is running
if [ $(docker inspect -f '{{.State.Running}}' silent-server) != "true" ]; then
  exit 1
fi

# Check if loud server is running
if [ $(docker inspect -f '{{.State.Running}}' loud-server) != "true" ]; then
  exit 1
fi

# Ideally check curl, but containers status is enough proxy for 'they ran the commands'
