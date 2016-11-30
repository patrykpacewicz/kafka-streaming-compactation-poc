#!/usr/bin/env bash

kafkaVersion=0.10.1.0
kafkaDir=/opt/kafka_2.11-${kafkaVersion}
kafkaConsoleProducerCmd=${kafkaDir}/bin/kafka-console-producer.sh
kafkaConsoleConsumerCmd=${kafkaDir}/bin/kafka-console-consumer.sh
kafkaTopicsCmd=${kafkaDir}/bin/kafka-topics.sh

dockerComposeConfig=$dir/config/docker-compose-kafka.yml
