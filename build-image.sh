#!/bin/bash

DOCKERFILE=Dockerfile
TAG=$KUBECTL_VERSION-build$BUILD

if [ "$DISTRO" == "alpine" ]; then
  DOCKERFILE=Dockerfile.alpine
  TAG=$TAG-alpine
fi

docker build --build-arg ver=$KUBECTL_VERSION -t laszlocloud/kubectl:$TAG -f $DOCKERFILE .
# docker push laszlocloud/kubectl:$TAG
