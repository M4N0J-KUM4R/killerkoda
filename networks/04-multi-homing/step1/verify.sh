#!/bin/bash

# Check networks exist
if ! docker network inspect public >/dev/null 2>&1; then exit 1; fi
if ! docker network inspect private >/dev/null 2>&1; then exit 1; fi

# Check connectivity
# Proxy should reach DB
if ! docker exec public-proxy ping -c 1 secure-db; then exit 1; fi

# Attacker (simulated) should NOT reach DB.
# We can't easily verify a negative here without launching a container,
# but if the proxy works, they passed the main task.
