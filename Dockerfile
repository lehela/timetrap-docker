FROM ruby:slim-buster AS base

# Note: below ARG defaults are overwritten by the 'build.sh' script at runtime.

# User inside docker container
ARG USERNAME=timetrap

# IDs for new user 
ARG USERUID=1001
ARG GROUPUID=1001

RUN \
# Install apt packages
    apt update && \
    apt install -y \
        vim \
        build-essential \
        bash-completion \
        screen \
        sqlite \
        libsqlite3-dev && \
# Install timetrap
    gem install timetrap 

RUN \
# Setup global path to hosts' bin folder
    mkdir -p /usr/local/host/bin && \
    echo export PATH=$PATH:/usr/local/host/bin >> /etc/bash.bashrc && \
# Enable global bash autocompletion 
    echo source /etc/bash_completion >> /etc/bash.bashrc && \
    find /usr -iname timetrap-autocomplete.bash | xargs echo source >> /etc/bash.bashrc

RUN \
# Setup user
    groupadd --gid ${USERUID} ${USERNAME} && \
    adduser --uid ${GROUPUID} --gid ${GROUPUID} --shell /bin/bash --gecos "" --disabled-password --quiet ${USERNAME}

# Switch to user
USER ${USERNAME}

RUN \
# Setup config to save sqlite database file to host path
    t configure && \
    sed -i 's/.timetrap.db/data\/.timetrap.db/' /home/${USERNAME}/.timetrap.yml 

WORKDIR /home/${USERNAME}

ENTRYPOINT [ "/bin/bash" ]

