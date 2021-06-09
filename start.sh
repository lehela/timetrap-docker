#!/bin/bash

# This script is to be run from the Docker hosts' local folder: 
# - starts the docker container
# - bind mounts the local bin & data directory
# - calls the 'bootstrap.sh' to use the local timezone

# Get current user & timezone
USERNAME=$(id -un)
LOCALTZ=$(cat /etc/timezone)

# Set executable flag on hosts' bin folder
chmod 700 bin/*
# Set strict permissions for hosts' data folder
chmod 600 data/*

# Start container
docker run --rm -it \
    -v "$(pwd)/data":/home/$USERNAME/data \
    -v "$(pwd)/bin":/usr/local/host/bin \
    --hostname timetrap \
    timetrap:latest \
    /usr/local/host/bin/bootstrap.sh $LOCALTZ
