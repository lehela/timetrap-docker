FROM ruby:slim-buster AS base

RUN \
# Change to local timezone
    ln -sf /usr/share/zoneinfo/Singapore /etc/localtime && \
# Install prerequisite packages
    apt update && \
    apt install -y \
        vim \
        build-essential \
        bash-completion \
        screen \
        sqlite \
        libsqlite3-dev

RUN \
# Install timetrap
    gem install timetrap && \
# Setup bash autocompletion by adding it to global bashrc
    echo source /etc/bash_completion >> /root/.bashrc && \
    find /usr -iname timetrap-autocomplete.bash | xargs echo source >> /root/.bashrc && \
# Setup timetrap to save sqlite database file to host path
    mkdir /host && \
    t configure && \
    sed -i 's/root\/.timetrap.db/host\/data\/.timetrap.db/' /root/.timetrap.yml

RUN \
# Setup script path to hosts' bin folder
    echo export PATH=$PATH:/host/bin >> /root/.bashrc

ENTRYPOINT [ "/bin/bash" ]
CMD [ "/host/bin/bootstrap.sh" ]
