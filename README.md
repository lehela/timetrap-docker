# TimeTrap 

Runs the [samg/timetrap](https://github.com/samg/timetrap) project inside a docker container. 

## Installation
1. Clone repository
2. Run `./build.sh`. 

## Basic Usage
1. Execute `./start.sh` to open an interactive shell inside the container.
2. Refer to the projects' [documentation](https://github.com/samg/timetrap#basic-usage) for basic usage of commands inside the container.
3. Execute `backup2csv.sh` from inside the container to backup your timesheets to a csv file in the `./data` subirectory

## Notes

The `build.sh` script creates the image with the following features:
- The `~/.timetrap.yaml` configuration is modified to store the sqlite database `.timetrap.db` in the hosts' bind mounted `./data` subirectory for persistence.
- A container user is created with identical Name, UID, and GID as the hosts' user running the `build.sh` script to avoid permission problems with the `./data` subdirectory.



