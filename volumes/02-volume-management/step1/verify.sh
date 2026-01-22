#!/bin/bash

# Check if 'important-data' is gone (it should be pruned)
if docker volume inspect important-data >/dev/null 2>&1; then
  exit 1
fi

# The goal is mostly to run the commands. If they pruned, they win.
