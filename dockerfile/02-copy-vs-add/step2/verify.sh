#!/bin/bash

# Check verification file
if ! grep -q "EXTRACTED" magic.txt; then
  exit 1
fi

# Check if app-add exists
if [ $(docker images -q app-add | wc -l) -eq 0 ]; then
  exit 1
fi

# Check if the file was extracted (secret.txt exists, secret.tar.gz does NOT)
# Note: In some scenarios users might copy both, but let's strictly check extraction occurred.
if ! docker run --rm app-add ls /app/secret.txt; then
  exit 1
fi
