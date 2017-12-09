#/bin/bash

case "$1" in
    start)
        docker-compose pull
        docker-compose up --build --remove-orphans -d teamspeak
    ;;

    stop)
        docker-compose down --remove-orphans
    ;;

    create)
        docker build --pull -t teamspeak-latest -f Dockerfile .
    ;;

    push)
        clear

        docker tag teamspeak-latest elnebuloso/teamspeak:3.0.13.6
        docker tag teamspeak-latest elnebuloso/teamspeak:3.0
        docker tag teamspeak-latest elnebuloso/teamspeak:3
        docker push elnebuloso/teamspeak:3.0.13.6
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