#!/bin/bash

# Check if sick-patient exists
if [ $(docker inspect -f '{{.State.Running}}' sick-patient) != "true" ]; then
  exit 1
fi

# Check if it is unhealthy (this might take time, so we check if the Config has Healthcheck enabled at least)
# Strict verification: Check 'Health.Status'
STATUS=$(docker inspect -f '{{.State.Health.Status}}' sick-patient)

# Status could be 'starting' or 'unhealthy'. If it's 'healthy', they failed the step.
if [ "$STATUS" == "healthy" ]; then
  exit 1
fi
