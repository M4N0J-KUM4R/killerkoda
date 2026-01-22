#!/bin/bash
# Check if second container acts as proof
if [ $(docker inspect -f '{{.State.Running}}' type-named-2) != "true" ]; then exit 1; fi
# Check if volume exists
if ! docker volume inspect my-vol >/dev/null 2>&1; then exit 1; fi
