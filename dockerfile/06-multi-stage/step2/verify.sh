#!/bin/bash

# Check if slim image exists
if [ $(docker images -q slim-app | wc -l) -eq 0 ]; then
  exit 1
fi

# Optional: Verify it's actually small (implying they used multi-stage)
SIZE=$(docker inspect -f '{{.Size}}' slim-app)
if [ "$SIZE" -gt 20000000 ]; then # 20MB
   exit 1
fi
