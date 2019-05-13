#!/bin/bash
IMAGE_NAME=jenkinscicd
docker ps -a |grep -q $IMAGE_NAME
OUT=$?
if [ $OUT -eq 0 ];then
	echo "stopping $IMAGE_NAME..."
	docker stop $IMAGE_NAME
	docker rm $IMAGE_NAME
fi
docker images $IMAGE_NAME |grep -q $IMAGE_NAME 
OUT=$?
if [ $OUT -eq 0 ];then
	echo "image $IMAGE_NAME found, removing..."
	docker image rmi $IMAGE_NAME
fi
docker build -t $IMAGE_NAME:latest .

docker run -d -v jenkins_home:/var/jenkins_home --mount type=bind,source=$HOME/CICDdemo,target=/CICDdemo -p 8080:8080 -p 50000:50000 --name $IMAGE_NAME $IMAGE_NAME:latest
