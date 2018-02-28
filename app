#/bin/bash

case "$1" in
    create)
        docker-compose pull
        docker-compose up --build --remove-orphans -d teamspeak
    ;;

    remove)
        docker-compose down --remove-orphans
    ;;

    bash)
        docker-compose run teamspeak bash
    ;;

    *)
        clear
        echo ""
        echo "- create  create all containers"
        echo "- remove  remove all containers"
        echo ""
    ;;
esac