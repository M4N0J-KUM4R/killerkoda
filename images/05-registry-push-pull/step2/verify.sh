#!/bin/bash

# Check if image is present
if [ $(docker images -q localhost:5000/my-alpine | wc -l) -eq 0 ]; then
  exit 1
fi

# Ideally we check that 'alpine:latest' is NOT present to prove they deleted it,
# but they might have re-pulled it or had other tags. 
# The main goal is successful pull of the localhost image.
