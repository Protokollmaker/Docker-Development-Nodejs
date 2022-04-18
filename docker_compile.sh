if [ "$1" = "dev" ]
  then
    if [ "$2" = "up" ]
    then
        echo "Compile up";
        docker-compose -f docker-compose.yaml -f docker-compose.dev.yaml up -d --force-recreate --build;
    elif [ "$2" = "down" ]
    then
        echo "Compile down";
        docker-compose -f docker-compose.yaml -f docker-compose.dev.yaml down -v;
    elif [ "$2" = "upl" ]
    then
        ./docker_compile.sh dev up;
        sleep 2;
        ./docker_compile.sh dev logs;
    fi
elif [ "$1" = "prod" ]
  then
    if [ "$2" = "up" ]
    then
        echo "Compile up";
        docker-compose -f docker-compose.yaml -f docker-compose.prod.yaml up -d --force-recreate --build;
    elif [ "$2" = "down" ]
    then
        echo "Compile down";
        docker-compose -f docker-compose.yaml -f docker-compose.prod.yaml down -v;
    elif [ "$2" = "upl" ]
    then
        ./docker_compile.sh prod up;
        sleep 2;
        ./docker_compile.sh prod logs;
    fi
fi

if [ "$2" = "sh" ]
then
    echo "Go in Contanier";
    docker exec -ti nodedev_node-app_1 sh;
elif [ "$2" = "logs" ]
then
    echo "Container Logs";
    docker logs nodedev_node-app_1;
elif [ "$2" = "stop" ]
then
    echo "Stop Container";
    docker stop nodedev_node-app_1;
elif [ "$2" = "rm" ]
then
    echo "Remove Container";
    docker rm nodedev_node-app_1;
fi

if [ "$1" = "" ]
then
    echo "ARCV 1---------------------------";
    echo "Pass in dev for development build";
    echo "Pass in prod for production build";
    echo "ARCV 2---------------------------";
    echo "Pass in up to docker-compile up";
    echo "Pass in down to docker-compile down";
    echo "--↓Works only if you replays container name↓--";
    echo "Pass in sh to go in container shell";
    echo "Pass in logs to display container logs";
    echo "Pass in upl to docker-compile up and display container logs";
fi