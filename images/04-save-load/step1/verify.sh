#!/bin/bash

# Check if tar exists
if [ ! -f alpine-backup.tar ]; then
  exit 1
fi

# Check if alpine image is GONE (or at least strictly the tag 'alpine:latest' is gone)
if [ $(docker images -q alpine:latest | wc -l) -ne 0 ]; then
  # It might be present if other tags exist, but we asked them to delete it.
  # Let's be strict.
  exit 1
fi
