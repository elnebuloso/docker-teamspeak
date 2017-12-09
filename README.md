# docker-teamspeak

Teamspeak Server

## docker hub

See Supported Tags at https://hub.docker.com/r/elnebuloso/teamspeak/tags/

#### Supported tags and respective `Dockerfile` links

- [`3` `3.0` `3.0.13.8` (Dockerfile)](https://github.com/elnebuloso/docker-teamspeak/blob/master/Dockerfile)

See full project details at https://github.com/elnebuloso/docker-teamspeak

## run the teamspeak container

```
docker run -d=true -p=9987:9987/udp -p=10011:10011 -p=30033:30033 elnebuloso/teamspeak
```

## server admin token

the server admin token can be found inside the container in /opt/teamspeak3-server_linux_amd64/logs

```
docker exec -it teamspeak sh -c 'tail -f  /opt/teamspeak3-server_linux_amd64/logs/*.log*'
```