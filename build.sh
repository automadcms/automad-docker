#!/bin/bash

version=v2.x-dev
name=automad/automad

docker ps -q --filter ancestor="$name:$version" | xargs docker stop
docker ps -a -q --filter ancestor="$name:$version" | xargs docker rm

docker rmi $name:$version

docker build --build-arg version=$version -t $name:$version .
docker run -d -p 8000:80 -v /tmp/automad-docker:/app -e UID=$(id -u) --name automad-dist $name:$version

docker images
