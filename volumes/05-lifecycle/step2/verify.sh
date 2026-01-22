#!/bin/bash
# Check if file was copied via docker cp (exists inside container)
if ! docker exec forgetful-app ls /data/slip.txt; then exit 1; fi
# Check if backup file exists locally (optional verification of step 4)
if [ ! -f slip_backup.txt ]; then exit 1; fi
