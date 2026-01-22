#!/bin/bash

# Check if child image exists
if [ $(docker images -q my-child | wc -l) -eq 0 ]; then
  exit 1
fi

# Run it and check output
if ! docker run --rm my-child | grep -q "I am the Child"; then
  exit 1
fi
