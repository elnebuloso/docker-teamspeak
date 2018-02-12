#/bin/bash

case "$1" in
    start)
        docker-compose pull
        docker-compose up --build --remove-orphans -d teamspeak
    ;;

    stop)
        docker-compose down --remove-orphans
    ;;

    *)
        clear
        echo ""
        echo "- start  start all containers"
        echo "- stop   stop all containers"
        echo ""
    ;;
esac