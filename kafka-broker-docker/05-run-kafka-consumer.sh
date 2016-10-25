#!/bin/bash -

KAFKA_DIR=/opt/kafka_2.11-0.10.0.1
KAFKA_TOPIC=$1
KAFKA_SH=kafka-topics.sh

if [ -z $KAFKA_TOPIC ] ; then
  echo Missing required argument "[topic]"
  echo "./$(basename "$0") \$topic"
  exit -1
fi

docker exec kafka-broker \
  $KAFKA_DIR/bin/$KAFKA_SH \
    --zookeeper "localhost:2181" \
    --topic $KAFKA_TOPIC \
    --from-beginning \
    --property print.key=true \
    --property key.separator=,
