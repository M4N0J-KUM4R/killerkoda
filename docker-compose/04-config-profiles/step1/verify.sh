#!/bin/bash

# Check env file
if [ ! -f .env ]; then exit 1; fi

# Check compose file for profiles
if ! grep "profiles:" docker-compose.yml; then exit 1; fi

# Check if they verified env var (can't verify they inspected it, but can verify it's running)
if [ $(docker compose ps -q app | wc -l) -eq 0 ]; then exit 1; fi

# We can check if they triggered the debug profile at least once in history?
# Hard to verify "history".
# Let's just ensure the files are correct.
