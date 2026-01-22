#!/bin/bash

# Check if image 'my-curl-image' exists
if [ $(docker images -q my-curl-image | wc -l) -eq 0 ]; then
  exit 1
fi

# Check if it actually has curl (simple check)
docker run --rm my-curl-image which curl > /dev/null 2>&1
if [ $? -ne 0 ]; then
  exit 1
fi
