FROM ubuntu:18.04
MAINTAINER jeff.tunessen@gmail.com

ENV TERM linux
ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update \
    && apt-get install -y --no-install-recommends \
        ca-certificates \
        bzip2 \
    && apt-get -y autoremove \
    && apt-get -y clean \
    && rm -rf /var/cache/apt/archives/* \
    && rm -rf /var/lib/apt/lists/* \
    && rm -rf /var/tmp/* \
    && rm -rf /usr/share/doc/* \
    && rm -rf /usr/share/man/* \
    && rm -rf /usr/share/locale/* \
    && rm -rf /tmp/*

ENV TS3SERVER_LICENSE accept
ARG TEAMSPEAK_VERSION

ADD http://dl.4players.de/ts/releases/${TEAMSPEAK_VERSION}/teamspeak3-server_linux_amd64-${TEAMSPEAK_VERSION}.tar.bz2 /tmp/teamspeak.tar.bz2

RUN tar -C /opt -xjf /tmp/teamspeak.tar.bz2 \
    && rm /tmp/teamspeak.tar.bz2

WORKDIR /opt/teamspeak3-server_linux_amd64

EXPOSE 9987/udp
EXPOSE 10011
EXPOSE 30033

CMD ["/opt/teamspeak3-server_linux_amd64/ts3server_minimal_runscript.sh"]