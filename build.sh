#!/bin/bash

set +x
set +e

[ -z "$DOCKER_EMAIL" ] && echo "set DOCKER_EMAIL env" && exit 1
[ -z "$DOCKER_USERNAME" ] && echo "set DOCKER_USERNAME env" && exit 1
[ -z "$DOCKER_PASSWORD" ] && echo "set DOCKER_PASSWORD env" && exit 1

trap 'rm _.dirs' SIGINT SIGTRAP SIGILL SIGTERM EXIT
find wkoszek -maxdepth 1 -mindepth 1 -type d > _.dirs

echo "# ----- will build following directories -----"
cat _.dirs

echo "# ----- logging into Docker Hub -----"
if [ "$USER" = "travis" ]; then
	docker login -e="$DOCKER_EMAIL" -u="$DOCKER_USERNAME" -p="$DOCKER_PASSWORD"
fi

while read D; do
	(
		echo "# ----- cd $D -----"
		cd $D
		
		echo "# ----- building $D -----"
		docker build -t $D .
		docker images

		echo "# ----- pushing $D -----"
		docker push $D
	)
done < _.dirs
