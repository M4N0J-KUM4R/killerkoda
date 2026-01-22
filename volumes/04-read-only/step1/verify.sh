#!/bin/bash

# Check audit file
if ! grep -q "SECURE" security_audit.txt; then exit 1; fi

# Optional: Verify container is actually read-only by trying it ourselves
if docker exec viewer sh -c "touch /app/config.ini" 2>/dev/null; then
  # If we managed to touch it, it wasn't read-only!
  exit 1
fi
