#!/bin/bash

docker build --build-arg ver=$KUBECTL_VERSION -t laszlocloud/kubectl:$KUBECTL_VERSION-$BUILD .
# docker push laszlocloud/kubectl:$KUBECTL_VERSION-$BUILD
