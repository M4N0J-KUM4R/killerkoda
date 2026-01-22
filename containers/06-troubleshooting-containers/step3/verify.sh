#!/bin/bash

# Check if crasher exists
if ! docker inspect crasher >/dev/null 2>&1; then
  exit 1
fi

# Check if it exited with code 1
EXIT_CODE=$(docker inspect -f '{{.State.ExitCode}}' crasher)
if [ "$EXIT_CODE" != "1" ]; then
  exit 1
fi
