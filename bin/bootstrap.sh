#!/bin/bash

# Switch to local timezone 
# This argument is passed by the "start.sh" script
export TZ="/usr/share/zoneinfo/$1"

# Set Bash Prompt
echo export PS1='"\\u@\\h \e[1;32m\A\[$(tput sgr0)\]\e[m > "' >> ~/.bashrc

# Display time entries for today to kick off the session
clear && t today --ids && echo

# Enter shell
cd ~ && /bin/bash

