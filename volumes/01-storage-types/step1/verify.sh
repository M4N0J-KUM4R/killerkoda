#!/bin/bash
# Check if container exists and is running
if [ $(docker inspect -f '{{.State.Running}}' type-bind) != "true" ]; then exit 1; fi
# Check mount type (optional but good)
if ! docker inspect type-bind | grep "Type" | grep "bind"; then exit 1; fi
