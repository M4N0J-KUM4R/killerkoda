#!/bin/bash

# Check if alpine is back
if [ $(docker images -q alpine | wc -l) -eq 0 ]; then
  exit 1
fi
