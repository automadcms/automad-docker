#!/bin/bash

docker ps -q --filter ancestor="automad/automad:latest" | xargs docker stop
docker ps -a -q --filter ancestor="automad/automad:latest" | xargs docker rm 

docker rmi automad/automad:latest

docker build --no-cache -t automad/automad .
docker run -d -p 8000:80 --name automad-latest automad/automad:latest 

docker images