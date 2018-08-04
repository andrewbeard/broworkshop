FROM ubuntu:16.04

LABEL maintainer Andrew Beard <bearda@gmail.com>

ARG DEBIAN_FRONTEND=noninteractive
RUN apt-get update && apt-get upgrade -y
RUN apt-get install -y --no-install-recommends apt-utils
RUN apt-get install -y --no-install-recommends git software-properties-common wget python-pip python-setuptools
RUN pip install --upgrade pip

# Add the official Bro package repository
RUN wget -q http://download.opensuse.org/repositories/network:bro/xUbuntu_16.04/Release.key -O Release.key
RUN apt-key add Release.key
RUN rm -f Release.key
RUN apt-add-repository -y 'deb http://download.opensuse.org/repositories/network:/bro/xUbuntu_16.04/ /'
RUN apt-get update

# Install Bro
RUN apt-get install -y --no-install-recommends bro
ENV BRO_HOME /opt/bro
ENV PATH $BRO_HOME/bin/:$PATH

# Install the Bro package manager
RUN pip install bro-pkg
RUN bro-pkg autoconfig
RUN echo "@load packages" >> /opt/bro/share/bro/site/local.bro

# Add the workshop files to the image
COPY . /root/broworkshop
