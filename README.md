<img src="https://raw.githubusercontent.com/elnebuloso/docker-phing/master/logo.png" width="100%"/>

# docker-teamspeak

![Release](https://github.com/elnebuloso/docker-phing/workflows/Release/badge.svg)
[![Docker Pulls](https://img.shields.io/docker/pulls/elnebuloso/teamspeak.svg)](https://hub.docker.com/r/elnebuloso/teamspeak)
[![GitHub](https://img.shields.io/github/license/elnebuloso/docker-ansible.svg)](https://github.com/elnebuloso/docker-teamspeak)

Dockerized Teamspeak Server

## run the teamspeak container

```
docker-pull elnebuloso/teamspeak
docker run -d --name teamspeak-server elnebuloso/teamspeak
docker logs -f teamspeak-server
```

## server admin token

the server admin token can be found inside the container in /opt/teamspeak3-server_linux_amd64/logs after startup, or with docker logging

```
docker logs -f teamspeak-server
```
