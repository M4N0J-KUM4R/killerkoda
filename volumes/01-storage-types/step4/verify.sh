#!/bin/bash
# We just check if they ran the commands.
# Hard to verify "learning" here, but we can check if they created ANY anonymous volume.
if [ $(docker volume ls -q | wc -l) -gt 0 ]; then echo "ok"; fi
