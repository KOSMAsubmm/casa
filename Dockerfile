FROM ubuntu:22.04

ARG UID=1000
ARG GID=1000

# Setup user and group
RUN mkdir /home/casa && \
    groupadd -g $GID casa && \
    useradd -g casa -u $UID -d /home/casa casa && \
    chown casa:casa /home/casa

ENV DEBIAN_FRONTEND=noninteractive

# Install necessary tools and libraries
RUN apt update && \
    apt install -y wget xz-utils fuse xserver-xorg-dev sqlite libxext-dev libx11-6 libfontconfig1 libsm-dev xserver-xorg libgtk-3-dev && \
    rm -rf /var/lib/apt/lists/*

# Download and extract casa-pipeline software
COPY casa-6.2.1-7-pipeline-2021.2.0.128.tar.xz .

RUN tar -xvf casa-6.2.1-7-pipeline-2021.2.0.128.tar.xz && \
    rm casa-6.2.1-7-pipeline-2021.2.0.128.tar.xz

# Set working directory and permissions
RUN chown -R casa:casa casa-6.2.1-7-pipeline-2021.2.0.128
WORKDIR /data

USER casa
CMD ["../casa-6.2.1-7-pipeline-2021.2.0.128/bin/casa"]