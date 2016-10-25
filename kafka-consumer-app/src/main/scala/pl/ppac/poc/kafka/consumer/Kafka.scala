package pl.ppac.poc.kafka.consumer

import java.util.{Properties, UUID}

import org.apache.kafka.clients.consumer.{ConsumerConfig, KafkaConsumer}
import org.apache.kafka.common.serialization.StringDeserializer

trait Kafka {
  def createKafkaConsumer(properties: Properties): KafkaConsumer[String, String] = {
    new KafkaConsumer[String, String](properties)
  }

  def createKafkaProperties(): Properties = {
    val props = new Properties()
    props.put("bootstrap.servers", "localhost:9092")
    props.put("group.id", UUID.randomUUID().toString)
    props.put("enable.auto.commit", "false")
    props.put("auto.commit.interval.ms", "1000")
    props.put("auto.offset.reset", "earliest")
    props.put("session.timeout.ms", "30000")
    props.put("key.deserializer", classOf[StringDeserializer].getName)
    props.put("value.deserializer", classOf[StringDeserializer].getName)
    props
  }
}
