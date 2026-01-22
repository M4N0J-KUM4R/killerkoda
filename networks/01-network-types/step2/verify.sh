#!/bin/bash
# Verify they can run host network
if ! docker run --rm --network host alpine true; then exit 1; fi
