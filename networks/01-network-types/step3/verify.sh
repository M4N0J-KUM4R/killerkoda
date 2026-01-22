#!/bin/bash
if ! docker run --rm --network none alpine true; then exit 1; fi
