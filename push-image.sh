#!/bin/bash

DOCKERFILE=Dockerfile
TAG=$KUBECTL_VERSION-$BUILD

if [ "$DISTRO" == "alpine" ]; then
  DOCKERFILE=Dockerfile.alpine
  TAG=$TAG-alpine
fi

echo "$DOCKER_PASSWORD" | docker login -u "$DOCKER_USERNAME" --password-stdin
docker push laszlocloud/kubectl:$TAG
