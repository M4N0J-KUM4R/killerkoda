#!/bin/bash
# Verify it was cleaned up
if [ -z "$(docker ps -a -q -f name=zombie)" ]; then
  exit 0
else
  exit 1
fi
