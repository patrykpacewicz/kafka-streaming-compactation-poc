#!/bin/bash -

KAFKA_DIR=/opt/kafka_2.11-0.10.0.1
KAFKA_TOPIC=$1
KAFKA_SH=kafka-topics.sh

if [ -z $KAFKA_TOPIC ] ; then
  echo Missing required argument "[topic]"
  echo "./$(basename "$0") \$topic"
  exit -1
fi

docker exec -i kafka-broker \
  $KAFKA_DIR/bin/$KAFKA_SH \
    --broker-list "localhost:9092" \
    --topic $KAFKA_TOPIC \
    --property parse.key=true \
    --property key.separator=,
