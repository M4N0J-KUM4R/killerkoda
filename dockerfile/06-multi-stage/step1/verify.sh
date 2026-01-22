#!/bin/bash

# Check if image exists
if [ $(docker images -q fat-app | wc -l) -eq 0 ]; then
  exit 1
fi
