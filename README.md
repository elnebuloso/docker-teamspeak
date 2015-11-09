# docker-teamspeak

## building teamspeak docker container through pull (preferred way)

```
docker pull elnebuloso/docker-teamspeak
```

## building teamspeak docker container through repository

```
git clone https://github.com/elnebuloso/docker-teamspeak
cd docker-teamspeak
docker build -t elnebuloso/docker-teamspeak .
```

## run the teamspeak container

```
# mandatory params
docker run -d=true -p=9987:9987/udp -p=10011:10011 -p=30033:30033 elnebuloso/docker-teamspeak

# optional with teamspeak data directory mounted
mkdir -p /path/to/your/teamspeak/data/directory
docker run -d=true -p=9987:9987/udp -p=10011:10011 -p=30033:30033 -v=/path/to/your/teamspeak/data/directory:/data elnebuloso/docker-teamspeak
```

## run options

* `-d=true` Run container in background and print container ID
* `-p` The Port connecting `-p=<host_port>:<docker_port>`
* `-v` mounting a volume `-v=<host_path>:<docker_path>`

## server admin token

the server admin token can be found inside the container in /data/logs, or when mounted in /path/to/your/teamspeak/data/directory

## useful command

```
docker start <container_id|container_name>
docker stop <container_id|container_name>

# console command into container
docker exec -ti <container_id|container_name> /bin/sh

# docker images
docker images

# docker containers
docker ps -a
```

## useful links

* https://github.com/wsargent/docker-cheat-sheet
