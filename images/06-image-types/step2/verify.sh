#!/bin/bash

if ! grep -q "NO_SHELL" secure.txt; then
  exit 1
fi
