#!/bin/bash

# Check if content matches Version 2
if ! curl -s localhost:8080 | grep "Version 2"; then
  exit 1
fi
