# Use the official Ubuntu 22.04 base image
FROM ubuntu:22.04

# install ssh
RUN apt-get update
RUN apt-get upgrade -y
RUN apt-get install -y curl
RUN apt-get install -y openssh-server sudo
RUN apt-get install -y net-tools

RUN useradd -ms /bin/bash "playerone"
RUN echo "playerone:password" | chpasswd

#download https://raw.githubusercontent.com/the-michael-albert/odbc-dev/main/msft.sh
RUN curl -o /home/playerone/msft.sh https://raw.githubusercontent.com/the-michael-albert/odbc-dev/main/msft.sh

# run the script
RUN chmod +x /home/playerone/msft.sh
RUN /home/playerone/msft.sh


# build and run using the following command
# docker build -t playerone . && docker run -it -p 2024:22 playerone

# RUN service ssh start

EXPOSE 22