## Base image to use
FROM ubuntu:14.04

## Maintainer info
MAINTAINER razorgirl <https://github.com/razorgirl>

## Add mono and NzbDrone repositories
RUN apt-key adv --keyserver keyserver.ubuntu.com --recv-keys FDA5DFFC
RUN echo "deb http://update.nzbdrone.com/repos/apt/debian master main" | sudo tee -a /etc/apt/sources.list

## Update base image
RUN apt-get update
RUN apt-get upgrade -y
RUN apt-get dist-upgrade -y

## Install prerequisites
RUN apt-get install -y mono-runtime

## Install NzbDrone
RUN apt-get install -y nzbdrone

## Expose port
EXPOSE 8989

## Set working directory
WORKDIR /opt/NzbDrone

## Run Couchpotato
ENTRYPOINT mono NzbDrone.exe
