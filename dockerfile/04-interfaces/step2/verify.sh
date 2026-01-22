#!/bin/bash

# Check if there is at least one dangling volume (created by the step)
# This is a loose check but adequate for this environment.
if [ $(docker volume ls -q -f dangling=true | wc -l) -lt 1 ]; then
  exit 1
fi
