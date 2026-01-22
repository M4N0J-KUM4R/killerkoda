#!/bin/bash

# Check if app-copy exists
if [ $(docker images -q app-copy | wc -l) -eq 0 ]; then
  exit 1
fi

# Check if the file is inside
if ! docker run --rm app-copy ls /app/hello.txt; then
  exit 1
fi
