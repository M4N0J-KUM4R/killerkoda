#!/bin/bash

# Check if they pulled the images
if [ $(docker images -q gcr.io/distroless/static-debian12 | wc -l) -eq 0 ]; then
  exit 1
fi

# Check the answer file
if ! grep -q "distroless" winner.txt; then
  exit 1
fi
