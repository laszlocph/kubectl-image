#!/bin/bash

expected='kubectl controls the Kubernetes cluster manager'
actual=$(docker run laszlocloud/kubectl:$VERSION kubectl)

if [[ $actual =~ .*$expected.* ]]; then
  echo PASS
else
  echo "expected '$expected', got '$actual'"
  exit 1
fi

expected='hello world'
actual=$( docker run -it -e "VAR=world" laszlocloud/kubectl:1.9.2 bash -c "echo 'hello \$VAR' | envsubst")

if [[ $actual =~ .*$expected.* ]]; then
  echo PASS
else
  echo "expected $expected, got $actual"
  exit 1
fi

exit 0
