#!/bin/bash

# This script is to be run inside the container

OUTPUT=~/data/timetrap.csv

# Write backup of all timesheets
t d -f csv all > $OUTPUT

echo 
echo "Info >> CSV file written to " $OUTPUT
echo