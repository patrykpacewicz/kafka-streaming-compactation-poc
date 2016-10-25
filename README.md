kafka-streaming-compactation-poc
================================

It's a Kafka log compaction PoC application.

Scripts
-------

| Script                       | Desc                                                           |
| ---------------------------- | -------------------------------------------------------------- |
| bin/01-run-kafka.sh          | starts zookeeper and kafka configured for compaction in docker |
| bin/03-create-kafka-topic.sh | creates kafka topic with compaction configuration              |
| bin/04-run-kafka-producer.sh | runs kafka producer                                            |
| bin/05-run-kafka-consumer.sh | runs kafka consumer                                            |

Example of usage
----------------

 1. Use kafka to produce and consumes data
```sh
bin/01-run-kafka.sh
bin/03-create-kafka-topic.sh ex-topic-name
bin/04-run-kafka-producer.sh ex-topic-name
bin/05-run-kafka-consumer.sh ex-topic-name
```

 2. Use kafka-client and kafka-stream liblaries example
 ```sh
 bin/01-run-kafka.sh
 bin/03-create-kafka-topic.sh ex-topic-name
 ./gradlew :kafka-producer-app:run -Ptopic=ex-topic-name
 bin/05-run-kafka-consumer.sh ex-topic-name
 ```
