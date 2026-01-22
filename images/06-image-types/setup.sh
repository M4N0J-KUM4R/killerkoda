#!/bin/bash
docker pull alpine
docker pull ubuntu
# Pre-pull distroless to save time
docker pull gcr.io/distroless/static-debian12
