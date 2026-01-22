#!/bin/bash

# Check if containers exist
if [ $(docker ps -q -f name=type-bind | wc -l) -eq 0 ]; then exit 1; fi
if [ $(docker ps -q -f name=type-named | wc -l) -eq 0 ]; then exit 1; fi
if [ $(docker ps -q -f name=type-tmpfs | wc -l) -eq 0 ]; then exit 1; fi
if [ $(docker ps -q -f name=type-anon | wc -l) -eq 0 ]; then exit 1; fi

# Check Bind Mount content
if ! docker exec type-bind ls /bind/hostfile.txt; then exit 1; fi

# Check Tmpfs is actually empty after restart (simulated by checking if the file is gone)
# Use a trick: if they ran the commands, the file should be gone.
if docker exec type-tmpfs ls /ramdisk/ghost 2>/dev/null; then exit 1; fi
