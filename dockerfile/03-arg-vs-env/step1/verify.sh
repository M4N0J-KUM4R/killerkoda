#!/bin/bash

# Check if image exists
if [ $(docker images -q app-arg | wc -l) -eq 0 ]; then
  exit 1
fi

# Check if version.txt has the correct content
if ! docker run --rm app-arg grep -q "Building version 2.0" version.txt; then
  exit 1
fi
