#!/bin/bash
docker image inspect spacecat:v1 > /dev/null 2>&1 || exit 1
docker ps | grep spacecat-web || exit 1
curl -s localhost:8080 | grep SpaceCat || exit 1
