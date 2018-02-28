#/bin/bash

case "$1" in
    create)
        docker-compose pull
        docker-compose up --build --remove-orphans -d teamspeak
        docker-compose logs
    ;;

    remove)
        docker-compose down --remove-orphans
    ;;

    latest)
        docker-pull elnebuloso/teamspeak
        docker run -d --rm --name teamspeak-server elnebuloso/teamspeak
        docker logs -f teamspeak-server
    ;;

    *)
        echo ""
        echo "- create  create all containers"
        echo "- remove  remove all containers"
        echo "- latest  start latest"
        echo ""
    ;;
esac