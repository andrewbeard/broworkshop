FROM ubuntu:16.04

LABEL maintainer Andrew Beard <bearda@gmail.com>

ARG DEBIAN_FRONTEND=noninteractive
RUN apt-get update && apt-get install -y --no-install-recommends apt-utils
RUN apt-get install -y git software-properties-common wget

# Add the official Bro package repository
RUN wget -q http://download.opensuse.org/repositories/network:bro/xUbuntu_16.04/Release.key -O Release.key
RUN apt-key add Release.key
RUN rm -f Release.key
RUN apt-add-repository -y 'deb http://download.opensuse.org/repositories/network:/bro/xUbuntu_16.04/ /'
RUN apt-get update

# Install Bro
RUN apt-get install -y bro

# Add the workshop files to the image
COPY . /root/broworkshop

ENV BRO_HOME /opt/bro
ENV PATH $BRO_HOME/bin/:$PATH
