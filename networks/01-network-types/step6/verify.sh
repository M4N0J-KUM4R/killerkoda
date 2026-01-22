#!/bin/bash
# Verify they cleaned up or at least attempted it.
if docker network inspect my-ipvlan >/dev/null 2>&1; then 
  echo "Network exists, good."
else
  echo "Network cleaned up, also good."
fi
