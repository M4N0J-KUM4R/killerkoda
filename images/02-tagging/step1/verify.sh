#!/bin/bash

# We just want to ensure they ran the commands.
# Since the last step is deleting the tag, there's nothing permanent to check except that 'alpine' still exists.

if [ $(docker images -q alpine | wc -l) -eq 0 ]; then
  exit 1
fi

# Ideally, we check history or partial state, but for this "interactive exploration", 
# ensuring they didn't delete the base alpine image is key.
