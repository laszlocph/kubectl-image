#!/bin/bash

TAG=$KUBECTL_VERSION-build$BUILD

if [ "$DISTRO" == "alpine" ]; then
  TAG=$TAG-alpine
fi

expected='kubectl controls the Kubernetes cluster manager'
actual=$(docker run laszlocloud/kubectl:$TAG kubectl)

if [[ $actual =~ .*$expected.* ]]; then
  echo PASS
else
  echo "expected '$expected', got '$actual'"
  exit 1
fi

expected='hello world'
actual=$( docker run -it -e "VAR=world" laszlocloud/kubectl:$TAG bash -c "echo 'hello \$VAR' | envsubst")

if [[ $actual =~ .*$expected.* ]]; then
  echo PASS
else
  echo "expected $expected, got $actual"
  exit 1
fi

exit 0
