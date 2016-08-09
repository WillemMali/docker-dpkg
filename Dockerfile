FROM debian:8
MAINTAINER WillemMali

WORKDIR /home/docker

RUN apt-get update
RUN apt-get upgrade -y

# install packages individually to allow installing them in phases (i.e. with slow internet while traveling)
RUN apt-get install -y automake autotools-dev coreutils debhelper debian-policy developers-reference dh-make devscripts fakeroot file git gnu-standards gnupg links2 lintian man patch patchutils pbuilder perl python quilt tmux vim xutils-dev

RUN useradd -ms /bin/bash docker
RUN echo "docker:docker" | chpasswd
RUN adduser docker sudo

RUN git clone https://github.com/WillemMali/dotfiles.git /home/docker/

USER docker

ENTRYPOINT /bin/sleep inf
