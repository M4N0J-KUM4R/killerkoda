#!/bin/bash
if [ $(docker inspect -f '{{.State.Running}}' type-tmpfs) != "true" ]; then exit 1; fi
