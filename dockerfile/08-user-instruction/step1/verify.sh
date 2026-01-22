#!/bin/bash

# Check if image exists
if [ $(docker images -q app-secure | wc -l) -eq 0 ]; then
  exit 1
fi

# Check effective user
USER=$(docker run --rm app-secure whoami)
if [ "$USER" != "appuser" ]; then
  exit 1
fi
