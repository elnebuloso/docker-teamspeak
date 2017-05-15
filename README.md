# docker-teamspeak

[![Docker Build Statu](https://img.shields.io/docker/build/elnebuloso/teamspeak.svg)](https://hub.docker.com/r/elnebuloso/teamspeak/builds/)

## run the teamspeak container

```
docker run -d=true -p=9987:9987/udp -p=10011:10011 -p=30033:30033 elnebuloso/teamspeak
```

## server admin token

the server admin token can be found inside the container in /opt/teamspeak3-server_linux_amd64


## links 

- https://hub.docker.com/r/elnebuloso/teamspeak/
- https://hub.docker.com/r/elnebuloso/teamspeak/tags/