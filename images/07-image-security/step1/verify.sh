#!/bin/bash

# Check the answer
if ! grep -q "101" best_practice.txt; then
  exit 1
fi
