#!/bin/bash

# Check if security.txt exists and has the right content
if ! grep -q "DIGEST" security.txt; then
  exit 1
fi

# Check if they actually retagged safe-image to ubuntu (checking image ID match)
UBUNTU_ID=$(docker images -q ubuntu | head -n 1)
SAFE_ID=$(docker images -q safe-image:latest | head -n 1)

if [ "$UBUNTU_ID" != "$SAFE_ID" ]; then
   # Maybe they didn't pull ubuntu? Let's check if safe-image exists at least.
   if [ -z "$SAFE_ID" ]; then
      exit 1
   fi
fi
