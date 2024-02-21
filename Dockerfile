# Use the official Ubuntu 22.04 base image
FROM ubuntu:22.04

# install ssh
RUN apt-get update
RUN apt-get upgrade -y
RUN apt-get install -y curl
# RUN apt-get install -y openssh-server sudo

RUN useradd -ms /bin/bash "playerone"
RUN echo "playerone:password" | chpasswd

