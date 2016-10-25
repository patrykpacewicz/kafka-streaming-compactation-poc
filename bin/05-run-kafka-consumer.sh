#!/bin/bash -

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
KAFKA_DIR=/opt/kafka_2.11-0.10.0.1
KAFKA_TOPIC=$1
KAFKA_SH=kafka-console-consumer.sh

if [ -z $KAFKA_TOPIC ] ; then
  echo Missing required argument "[topic]"
  echo "./$(basename "$0") \$topic"
  exit -1
fi

docker-compose -f $DIR/config/docker-compose-kafka.yml exec kafka \
  $KAFKA_DIR/bin/$KAFKA_SH \
    --zookeeper "zookeeper:2181" \
    --topic $KAFKA_TOPIC \
    --from-beginning \
    --property print.key=true \
    --property key.separator=,
