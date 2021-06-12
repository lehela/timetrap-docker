#!/bin/bash

# Default container user mimicks the current user to avoid permission problems on bind mounts.
USERNAME=$(id -un)
USERUID=$(id -u)
GROUPUID=$(id -g)

# Build image 
docker image build \
    --build-arg USERNAME=$USERNAME \
    --build-arg USERUID=$USERUID \
    --build-arg GROUPUID=$GROUPUID \
    --tag lehela/timetrap:latest \
    .
