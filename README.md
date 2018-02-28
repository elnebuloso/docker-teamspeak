# docker-teamspeak

Teamspeak Server

## docker hub

See Supported Tags at https://hub.docker.com/r/elnebuloso/teamspeak/tags/

#### Supported tags and respective `Dockerfile` links

- [`latest` `3` `3.0` `3.1.0` (Dockerfile)](https://github.com/elnebuloso/docker-teamspeak/blob/master/Dockerfile)

## run the teamspeak container

```
docker run --name teamspeak -d=true -p=9987:9987/udp -p=10011:10011 -p=30033:30033 elnebuloso/teamspeak
```

## server admin token

the server admin token can be found inside the container in /opt/teamspeak3-server_linux_amd64/logs

```
docker logs elnebuloso/teamspeak
docker exec -it teamspeak sh -c 'tail -f  /opt/teamspeak3-server_linux_amd64/logs/*.log*'
```
