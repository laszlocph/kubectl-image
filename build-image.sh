#!/bin/bash

docker build --build-arg ver=$VERSION -t laszlocloud/kubectl:$VERSION .
docker push laszlocloud/kubectl:$VERSION
