#!/bin/bash

set +x

trap 'rm _.dirs' SIGINT SIGTRAP SIGILL SIGTERM
find wkoszek -type d -depth 1 > _.dirs

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
