#!/bin/bash -

dir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
source $dir/config/config.sh

kafkaTopic=$1

if [ -z $kafkaTopic ] ; then
  echo Missing required argument "[topic]"
  echo "./$(basename "$0") \$topic"
  exit -1
fi

docker-compose -f $dockerComposeConfig exec kafka \
  $kafkaTopicsCmd \
    --create \
    --partitions 1 \
    --replication-factor 1 \
    --topic $kafkaTopic \
    --config segment.ms="30000" \
    --config cleanup.policy="compact" \
    --zookeeper "zookeeper:2181"
