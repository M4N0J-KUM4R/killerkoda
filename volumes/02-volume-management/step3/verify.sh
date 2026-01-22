#!/bin/bash
# Check if important-data is gone
if docker volume inspect important-data >/dev/null 2>&1; then exit 1; fi
# Actually, if they pruned, volume count should be 0 ideally, or just important-data missing.
