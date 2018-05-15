#!/bin/bash

expected='kubectl controls the Kubernetes cluster manager'
actual=$(docker run laszlocloud/kubectl:$KUBECTL_VERSION-$BUILD kubectl)

if [[ $actual =~ .*$expected.* ]]; then
  echo PASS
else
  echo "expected '$expected', got '$actual'"
  exit 1
fi

expected='hello world'
actual=$( docker run -it -e "VAR=world" laszlocloud/kubectl:$KUBECTL_VERSION-$BUILD bash -c "echo 'hello \$VAR' | envsubst")

if [[ $actual =~ .*$expected.* ]]; then
  echo PASS
else
  echo "expected $expected, got $actual"
  exit 1
fi

exit 0
