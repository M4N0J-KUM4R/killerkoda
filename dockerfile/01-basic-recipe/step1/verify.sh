#!/bin/bash

# Check if image exists
if [ $(docker images -q my-first-image | wc -l) -eq 0 ]; then
  exit 1
fi

# Check if WORKDIR was set (by checking default directory)
# We expect /app to be the workdir
if [ "$(docker run --rm my-first-image pwd)" != "/app" ]; then
  exit 1
fi
