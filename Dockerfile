# http://docs.docker.com/engine/articles/dockerfile_best-practices/
# In addition, cleaning up the apt cache and removing /var/lib/apt/lists helps keep the image size down.
# Since the RUN statement starts with apt-get update, the package cache will always be refreshed prior to apt-get install.

# system
FROM ubuntu:14.04

# run as noninteractive ignoring notifications we cannot answer during installation
ENV DEBIAN_FRONTEND noninteractive

# install essentials
RUN apt-get update && apt-get install -y \
  curl \
&& apt-get clean \
&& rm -rf /var/lib/apt/lists/*

# download and install teamspeak
RUN curl "http://dl.4players.de/ts/releases/3.0.11.4/teamspeak3-server_linux-amd64-3.0.11.4.tar.gz" -o teamspeak3-server_linux-amd64-3.0.11.4.tar.gz
RUN tar zxf teamspeak3-server_linux-amd64-3.0.11.4.tar.gz; mv teamspeak3-server_linux-amd64 /opt/teamspeak; rm teamspeak3-server_linux-amd64-3.0.11.4.tar.gz

# load scripts
ADD ./start.sh /start

# fix permissions in scripts
RUN chmod +x /start

# /start runs it.
EXPOSE 9987/udp
EXPOSE 10011
EXPOSE 30033

VOLUME ["/data"]
CMD ["/start"]