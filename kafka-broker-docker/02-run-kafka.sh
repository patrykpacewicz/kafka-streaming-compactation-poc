#!/bin/bash -

docker rm \
  -f kafka-broker

docker run \
  --rm \
  --name kafka-broker \
  -p 9092:9092 \
  --net=host \
  --add-host=moby:127.0.0.1 \
  -e KAFKA_ADVERTISED_HOST_NAME="127.0.0.1" \
  -e KAFKA_ADVERTISED_PORT="9092" \
  -e KAFKA_ZOOKEEPER_CONNECT="127.0.0.1:2181" \
  -e KAFKA_LOG_CLEANER_ENABLE="true" \
  -e KAFKA_LOG_CLEANUP_POLICY="compact" \
  -e KAFKA_LOG_SEGMENT_DELETE_DELAY_MS="30000" \
  -t wurstmeister/kafka

docker rm \
  -f kafka-broker
