#!/bin/bash
 
# Verify 'ghost' container does NOT exist (running or stopped)
if docker inspect ghost >/dev/null 2>&1; then
  exit 1 # Found it, fail
fi
