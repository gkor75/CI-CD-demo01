#!/bin/bash

docker run \
    -d --restart always \
    -v $HOME/gitlab_data/data:/var/opt/gitlab \
    -v $HOME/gitlab_data/logs:/var/log/gitlab \
    -v $HOME/gitlab_data/config:/etc/gitlab \
    -p 1022:22 \
    -p 1080:80 \
    -p 10443:443 \
    --name gitlab \
    gitlab/gitlab-ce:latest

