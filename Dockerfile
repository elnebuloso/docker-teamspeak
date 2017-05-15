# system
FROM ubuntu:16.04
MAINTAINER jeff.tunessen@gmail.com

# terminal
ENV TERM linux
ENV DEBIAN_FRONTEND noninteractive
ENV TEAMSPEAK_VERSION 3.0.13.6

# download teamspeak3
ADD http://dl.4players.de/ts/releases/${TEAMSPEAK_VERSION}/teamspeak3-server_linux_amd64-${TEAMSPEAK_VERSION}.tar.bz2 /tmp/teamspeak.tar.bz2

# install teamspeak3
RUN apt-get update \
    && apt-get install -y --no-install-recommends less bzip2 \
    && tar -C /opt -xjf /tmp/teamspeak.tar.bz2 \
    && rm /tmp/teamspeak.tar.bz2 \
    && echo 'alias l="ls -alhF"' > /root/.bash_aliases \
    && apt-get -y autoremove \
    && apt-get -y clean \
    && rm -rf /var/cache/apt/archives/* \
    && rm -rf /var/lib/apt/lists/* \
    && rm -rf /var/tmp/* \
    && rm -rf /usr/share/doc/* \
    && rm -rf /usr/share/man/* \
    && rm -rf /usr/share/locale/* \
    && rm -rf /tmp/*

# make startup script
ADD /scripts/ /opt/scripts/
RUN chmod -R 774 /opt/scripts/

# teamspeak3 server directory
WORKDIR /opt/teamspeak3-server_linux_amd64

# teamspeak3 ports
EXPOSE 9987/udp
EXPOSE 10011
EXPOSE 30033

# run teamspeak3
CMD ["/opt/scripts/start.sh"]