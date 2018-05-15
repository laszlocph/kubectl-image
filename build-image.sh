#!/bin/bash

DOCKERFILE=Dockerfile
TAG=$KUBECTL_VERSION-build$BUILD

if [ "$DISTRO" == "alpine" ]; then
  DOCKERFILE=Dockerfile.alpine
  TAG=$TAG-alpine
fi

docker build --build-arg ver=$KUBECTL_VERSION -t laszlocloud/kubectl:$TAG -f $DOCKERFILE .

echo "$DOCKER_PASSWORD" | docker login -u "$DOCKER_USERNAME" --password-stdin
#docker push laszlocloud/kubectl:$TAG
