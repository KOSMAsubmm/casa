FROM ubuntu:20.04

ARG UID=1000
ARG GID=1000

RUN mkdir /home/casa && \
    groupadd -g $GID casa && \
    useradd -g casa -u $UID -d /home/casa casa && \
    chown casa:casa /home/casa

RUN apt update && \
    apt install -y wget xz-utils  && \
    wget https://casa.nrao.edu/download/distro/casa/release/rhel/casa-6.4.4-31-py3.8.tar.xz 
RUN tar -xvf casa-6.4.4-31-py3.8.tar.xz
RUN rm -rf casa-6.4.4-31-py3.8.tar.xz

RUN DEBIAN_FRONTEND=noninteractive TZ=Etc/UTC apt install -y fuse xserver-xorg-dev  sqlite libxext-dev libx11-6 libfontconfig1 libsm-dev xserver-xorg libgtk-3-dev
WORKDIR data
RUN chown -R casa:casa ../casa-6.4.4-31-py3.8
USER casa
CMD ["../casa-6.4.4-31-py3.8/bin/casa"]