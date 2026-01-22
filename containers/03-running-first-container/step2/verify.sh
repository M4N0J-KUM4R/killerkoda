#!/bin/bash
 
# Check if ANY nginx container is running
if [ $(docker ps -q -f ancestor=nginx | wc -l) -eq 0 ]; then
  exit 1
fi
