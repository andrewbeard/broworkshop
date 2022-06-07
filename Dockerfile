FROM ubuntu:22.04

LABEL maintainer Andrew Beard <bearda@gmail.com>

ARG DEBIAN_FRONTEND=noninteractive
RUN apt-get update && \
    apt-get install -y --no-install-recommends ca-certificates curl gpg gpg-agent && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# Add the official Zeek package repository and install Zeek
RUN curl -fsSL 'https://download.opensuse.org/repositories/security:zeek/xUbuntu_22.04/Release.key' | gpg --dearmor | tee /etc/apt/trusted.gpg.d/security_zeek.gpg > /dev/null && \
    echo 'deb http://download.opensuse.org/repositories/security:/zeek/xUbuntu_22.04/ /' | tee /etc/apt/sources.list.d/security:zeek.list && \
    apt-get update && \
    apt-get install -y --no-install-recommends git less nano vim zeek-core zeekctl zeek-zkg && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

ENV ZEEK_HOME /opt/zeek
ENV PATH $ZEEK_HOME/bin/:$PATH

# Set up the Zeek package manager
RUN zkg autoconfig && \
    echo "@load packages" >> /opt/zeek/share/zeek/site/local.bro

RUN mkdir -p /root/workshop
COPY . /root/workshop/
WORKDIR /root/workshop
