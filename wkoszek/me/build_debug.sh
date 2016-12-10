#!/bin/bash

set +x
set +e

[ -z "$DOCKER_EMAIL" ] && echo "set DOCKER_EMAIL env" && exit 1
[ -z "$DOCKER_USERNAME" ] && echo "set DOCKER_USERNAME env" && exit 1
[ -z "$DOCKER_PASSWORD" ] && echo "set DOCKER_PASSWORD env" && exit 1

docker login -u="$DOCKER_USERNAME" -p="$DOCKER_PASSWORD"

docker build -t wkoszek/me .
docker push wkoszek/me
