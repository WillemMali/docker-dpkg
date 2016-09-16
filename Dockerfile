FROM debian:8
MAINTAINER WillemMali

WORKDIR /home/docker

# get fresh packages
RUN apt-get update
RUN apt-get upgrade -y

# install packages individually to allow installing them in phases (i.e. with slow internet while traveling)
RUN apt-get install -y automake autotools-dev coreutils debhelper debian-policy developers-reference dh-make devscripts fakeroot file git gnu-standards gnupg links2 lintian man patch patchutils pbuilder perl python quilt tmux vim xutils-dev

# add Docker user and give them a folder (useradd -m
# makes the folder and chown gives it to the docker user)
RUN useradd -ms /bin/bash docker
RUN chown -R docker:docker /home/docker
RUN echo "docker:docker" | chpasswd
RUN adduser docker sudo

#                                     #
#   ^    ^    ^    ^    ^    ^    ^   #
#   |    |    |    |    |    |    |   #
#   |    |    |    |    |    |    |   #
#   |    |    |    |    |    |    |   #
#                                     #
#            ROOT USER                #
#                                     #
#-------------------------------------#

USER docker

#-------------------------------------#
#                                     #
#          NON-ROOT USER              #
#                                     #
#   |    |    |    |    |    |    |   #
#   |    |    |    |    |    |    |   #
#   |    |    |    |    |    |    |   #
#   v    v    v    v    v    v    v   #
#                                     #

RUN git clone https://github.com/WillemMali/dotfiles.git /home/docker/dotfiles
RUN $HOME/dotfiles/deploy.sh

# do as little as possible but keep running
ENTRYPOINT /bin/sleep inf
