FROM debian:8
MAINTAINER WillemMali

RUN apt-get update
RUN apt-get upgrade -y

# install packages individually to allow installing them in phases (i.e. with slow internet while traveling)
RUN apt-get install -y automake
RUN apt-get install -y autotools-dev
RUN apt-get install -y coreutils
RUN apt-get install -y debhelper
RUN apt-get install -y debian-policy
RUN apt-get install -y developers-reference
RUN apt-get install -y dh-make
RUN apt-get install -y devscripts
RUN apt-get install -y fakeroot
RUN apt-get install -y file
RUN apt-get install -y gfortran
RUN apt-get install -y git
RUN apt-get install -y gnu-standards
RUN apt-get install -y gnupg
RUN apt-get install -y links2
RUN apt-get install -y lintian
RUN apt-get install -y man
RUN apt-get install -y patch
RUN apt-get install -y patchutils
RUN apt-get install -y pbuilder
RUN apt-get install -y perl
RUN apt-get install -y python
RUN apt-get install -y quilt
RUN apt-get install -y tmux
RUN apt-get install -y vim
RUN apt-get install -y xutils-dev

RUN useradd -ms /bin/bash docker
RUN echo "docker:docker" | chpasswd
RUN adduser docker sudo

USER docker
WORKDIR /home/docker

ENTRYPOINT /bin/sleep inf
