#!/bin/bash

# Check if network exists
if ! docker network inspect my-net >/dev/null 2>&1; then exit 1; fi

# Check if containers can ping each other
if ! docker exec modern-2 ping -c 1 modern-1; then exit 1; fi
