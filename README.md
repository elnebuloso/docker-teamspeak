# docker-teamspeak

Teamspeak Server

## docker hub

See Supported Tags at https://hub.docker.com/r/elnebuloso/teamspeak/tags/

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
