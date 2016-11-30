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
  $kafkaConsoleProducerCmd \
    --broker-list "localhost:9092" \
    --topic $kafkaTopic \
    --property parse.key=true \
    --property key.separator=,
