#!/bin/bash

# Check that nginx is NOT running (since user should have Ctrl+C'd it)
if [ $(docker ps -q -f ancestor=nginx | wc -l) -gt 0 ]; then
  echo "Expected nginx to be stopped, but found running instances."
  exit 1
fi
