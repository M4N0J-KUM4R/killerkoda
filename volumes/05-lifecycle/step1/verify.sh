#!/bin/bash
# Check if container has the volume
if ! docker inspect forgetful-app | grep -q "/data"; then exit 1; fi
