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
    --create \
    --partitions 1 \
    --replication-factor 1 \
    --topic $KAFKA_TOPIC \
    --config segment.ms="30000" \
    --config cleanup.policy="compact" \
    --zookeeper "127.0.0.1:2181"
