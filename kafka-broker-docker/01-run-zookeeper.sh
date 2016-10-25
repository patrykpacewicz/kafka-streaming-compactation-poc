#!/bin/bash -

docker rm \
  -f zookeeper

docker run \
  --rm \
  --name zookeeper \
  -p 2181:2181 \
  -t wurstmeister/zookeeper

docker rm \
  -f zookeeper
