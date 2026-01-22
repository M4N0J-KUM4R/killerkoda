#!/bin/bash
# We check if there is at least one "long hash" volume.
# Or simpler: count volumes. Should be at least 2 (important-data + anonymous).
if [ $(docker volume ls -q | wc -l) -lt 2 ]; then exit 1; fi
