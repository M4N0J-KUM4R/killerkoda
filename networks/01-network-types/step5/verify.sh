#!/bin/bash
# Check if they cleaned up (best practice) OR if they created the macvlan
# Since the step ends with cleanup, let's verify cleanup.
if docker service inspect mesh-app >/dev/null 2>&1; then exit 1; fi
