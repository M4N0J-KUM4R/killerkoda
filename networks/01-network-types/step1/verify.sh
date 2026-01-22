#!/bin/bash
# Just basic check
if ! docker run --rm alpine true; then exit 1; fi
