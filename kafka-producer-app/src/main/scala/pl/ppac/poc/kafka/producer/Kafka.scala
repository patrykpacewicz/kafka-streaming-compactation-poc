package pl.ppac.poc.kafka.producer

import java.util.Properties

import org.apache.kafka.clients.producer.KafkaProducer
import org.apache.kafka.common.serialization.StringSerializer

trait Kafka {
  def createKafkaProducer(properties: Properties): KafkaProducer[String, String] = {
    new KafkaProducer[String, String](properties)
  }

  def createKafkaProperties(): Properties = {
    val props = new Properties()
    props.put("bootstrap.servers", "localhost:9092")
    props.put("key.serializer", classOf[StringSerializer].getName)
    props.put("value.serializer", classOf[StringSerializer].getName)
    props
  }
}
