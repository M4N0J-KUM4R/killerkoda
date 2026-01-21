#!/bin/bash
if [ -f /root/app/checked.txt ]; then
  exit 0
else
  echo "Please create the checked.txt file inside /root/app to confirm inspection."
  exit 1
fi
