FROM ubuntu:20.04

LABEL maintainer Andrew Beard <bearda@gmail.com>

ARG DEBIAN_FRONTEND=noninteractive
RUN apt-get update && \
    apt-get install -y --no-install-recommends wget ca-certificates gpg gpg-agent && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# Add the official Zeek package repository and install Zeek
RUN wget -q -O- "https://download.opensuse.org/repositories/security:zeek/xUbuntu_20.04/Release.key" | APT_KEY_DONT_WARN_ON_DANGEROUS_USAGE=1 apt-key add - && \
    echo "deb http://download.opensuse.org/repositories/security:/zeek/xUbuntu_20.04/ /" >> /etc/apt/sources.list.d/zeek.list && \
    apt-get update && \
    apt-get install -y --no-install-recommends git less nano zeek && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

ENV ZEEK_HOME /opt/zeek
ENV PATH $ZEEK_HOME/bin/:$PATH

# Set up the Zeek package manager
RUN zkg autoconfig && \
    echo "@load packages" >> /opt/zeek/share/zeek/site/local.bro
