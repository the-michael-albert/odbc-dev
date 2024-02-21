# Use the official Ubuntu 22.04 base image
FROM ubuntu:22.04

# install ssh
RUN apt-get update
RUN apt-get upgrade -y
RUN apt-get install -y curl
RUN apt-get install -y openssh-server sudo
RUN apt-get install -y net-tools
RUN apt install -y unixodbc-dev
RUN apt-get install g++ -y
RUN apt-get install -y mariadb-server

RUN useradd -ms /bin/bash "playerone"
RUN echo "playerone:password" | chpasswd
RUN usermod -aG sudo playerone

#download https://raw.githubusercontent.com/the-michael-albert/odbc-dev/main/msft.sh
RUN curl -o /home/playerone/msft.sh https://raw.githubusercontent.com/the-michael-albert/odbc-dev/main/msft.sh

# run the script
RUN chmod +x /home/playerone/msft.sh
RUN /home/playerone/msft.sh


# build and run using the following command
# docker build -t playerone . && docker run -it -p 2024:22 playerone

#this starts the ssh service when the container is run
RUN echo "service ssh start" >> /home/playerone/.bashrc
RUN echo "service ssh start" >> /root/.bashrc
RUN echo "service mariadb start" >> /root/.bashrc


EXPOSE 22
