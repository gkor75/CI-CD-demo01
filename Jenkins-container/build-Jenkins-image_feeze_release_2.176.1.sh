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
docker build -f Dockerfile_freeze_release_2.176.1 -t $IMAGE_NAME:2.176.1 .

docker run -d -v jenkins_home:/var/jenkins_home \
              -v /var/run/docker.sock:/var/run/docker.sock \
              -p 8080:8080 -p 50000:50000 --name $IMAGE_NAME $IMAGE_NAME:2.176.1
