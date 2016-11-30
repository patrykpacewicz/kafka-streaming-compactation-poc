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
  $kafkaConsoleConsumerCmd \
    --bootstrap-server "localhost:9092" \
    --topic $kafkaTopic \
    --from-beginning \
    --property print.key=true \
    --property key.separator=,
