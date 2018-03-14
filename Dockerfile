FROM ubuntu:16.04

LABEL maintainer Andrew Beard <abeard@arbor.net>

RUN apt-get update && apt-get install -y
RUN DEBIAN_FRONTEND=noninteractive apt-get install -y git software-properties-common wget
RUN wget -q http://download.opensuse.org/repositories/network:bro/xUbuntu_16.04/Release.key -O Release.key
RUN apt-key add Release.key
RUN rm -f Release.key
RUN apt-add-repository -y 'deb http://download.opensuse.org/repositories/network:/bro/xUbuntu_16.04/ /'
RUN apt-get update
RUN DEBIAN_FRONTEND=noninteractive apt-get install -y bro

# Add the workshop files to the image
RUN mkdir /root/broworkship
COPY . /root/broworkshop

ENV BRO_HOME /opt/bro
ENV PATH $BRO_HOME/bin/:$PATH

CMD /bin/bash -c 'BASH_ENV=/etc/profile exec bash'
