#!/bin/bash
# Clean slate
docker rm -f $(docker ps -aq) 2>/dev/null
