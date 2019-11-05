FROM ubuntu:trusty

MAINTAINER Aditya Avanth <avant.aditya@gmail.com>

#Prevent dpkg errors
ENV TERM=xterm-256color

#Set mirrors for easy package management and faster downloads
RUN sed -i "s/http:\/\/archive./http:\/\/nz.archive./g" /etc/apt/sources.list

#Install python runtime
RUN apt-get update &&\
    apt-get install -y \
    -o APT::Install-Recommend=false -o APT::Install-Suggests=false \
    python python-virtualenv libpython2.7 python-mysqldb libmysqlclient-dev


#Create virtual env and upgrade pip in virtual env to latest version
RUN virtualenv /appenv &&\
    . /appenv/bin/activate &&\
    pip install pip --upgrade


#Add enrtypoint script to activate virtual env
ADD scripts/entrypoint.sh /usr/local/bin/entrypoint.sh
RUN chmod +x /usr/local/bin/entrypoint.sh
ENTRYPOINT ["entrypoint.sh"]

