#/bin/bash

case "$1" in
    start)
        docker-compose pull
        docker-compose up --build --remove-orphans -d teamspeak
        docker-compose exec teamspeak sh -c 'tail -f  /opt/teamspeak3-server_linux_amd64/logs/*.log*'
    ;;

    stop)
        docker-compose down --remove-orphans
    ;;

    create)
        docker rm -f teamspeak-latest
        docker build --pull -t teamspeak-latest -f Dockerfile .
        docker run -d=true -p=9987:9987/udp -p=10011:10011 -p=30033:30033 --name=teamspeak-latest teamspeak-latest

        sleep 5
        docker exec teamspeak-latest sh -c 'tail -f /opt/teamspeak3-server_linux_amd64/logs/*.log*'
    ;;

    push)
        clear

        docker tag teamspeak-latest elnebuloso/teamspeak:3.0.13.8
        docker tag teamspeak-latest elnebuloso/teamspeak:3.0
        docker tag teamspeak-latest elnebuloso/teamspeak:3
        docker push elnebuloso/teamspeak:3.0.13.8
        docker push elnebuloso/teamspeak:3.0
        docker push elnebuloso/teamspeak:3
    ;;

    *)
        clear
        echo ""
        echo "- start   Start all containers"
        echo "- stop    Stop all containers"
        echo "- create  Create Images"
        echo "- push    Push Images"
        echo ""
    ;;
esac