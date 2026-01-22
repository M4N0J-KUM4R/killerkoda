#!/bin/bash

# Optional: Verify container is actually read-only by trying it ourselves
if docker exec viewer sh -c "touch /app/config.ini" 2>/dev/null; then
  # If we managed to touch it, it wasn't read-only!
  exit 1
fi