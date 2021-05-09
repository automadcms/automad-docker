#!/bin/bash

docker ps -q --filter ancestor="automad/automad:latest" | xargs docker stop
docker ps -a -q --filter ancestor="automad/automad:latest" | xargs docker rm 

docker ps -q --filter ancestor="automad/automad:clean" | xargs docker stop
docker ps -a -q --filter ancestor="automad/automad:clean" | xargs docker rm 

docker rmi automad/automad:latest
docker rmi automad/automad:clean 

docker build --no-cache -t automad/automad .
docker build --no-cache -t automad/automad:clean clean

docker run -d -p 8000:80 --name automad-latest automad/automad:latest 
docker run -d -p 8001:80 --name automad-clean automad/automad:clean

docker images