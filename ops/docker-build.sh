#!/usr/bin/env bash
set -e
source ./ops/env.sh
docker ps -q -a | xargs docker rm && sudo docker images -q -a | xargs docker rmi -f
docker build -t ${DOCKER_TAG} .
