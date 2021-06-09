# TimeTrap 

Runs the [TimeTrap]([https://link](https://github.com/samg/timetrap)) time tracker inside a docker container. 

## Installation
1. Clone repository
2. `./build.sh`

Note: the tracker uses a sqlite database file, which this script configures to be stores in the `./data` subirectory.

## Basic Usage
1. Execute `./start.sh` which opens an interactive shell inside the container.
2. Refer to the projects' [documentation](https://github.com/samg/timetrap#basic-usage) for basic usage of commands inside the container.
3. Execute `backup2csv.sh` from inside the container to backup the sqllite database to a csv file in the `./data` subirectory


