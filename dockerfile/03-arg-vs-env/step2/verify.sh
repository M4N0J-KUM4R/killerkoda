#!/bin/bash

# Check if image exists
if [ $(docker images -q app-env | wc -l) -eq 0 ]; then
  exit 1
fi

# Check if ENV is set to production by default
if ! docker run --rm app-env env | grep -q "APP_MODE=production"; then
  exit 1
fi
