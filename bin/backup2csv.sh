#!/bin/bash

OUTPUT=/host/data/timetrap.csv

# To be run inside the container
t d -f csv > $OUTPUT
chown 1001:1001 $OUTPUT

echo 
echo "CSV file written to " $OUTPUT
echo