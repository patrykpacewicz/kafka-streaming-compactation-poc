package pl.ppac.poc.kafka.producer

import java.util.concurrent.TimeUnit

import com.typesafe.scalalogging.slf4j.LazyLogging
import org.apache.kafka.clients.producer.{KafkaProducer, ProducerRecord}

object ProducerSenderImplicit {
  implicit def producerSend(producer: KafkaProducer[String, String]): ProducerSenderImplicit = new ProducerSenderImplicit(producer)
}

class ProducerSenderImplicit(producer: KafkaProducer[String, String]) extends LazyLogging {
  def send(topic: String, key: String, data: String): Unit = {
    logger.info(s"Sending on {topic: $topic, key: $key, data: $data}")

    val sendFuture = producer.send(new ProducerRecord[String, String](topic, key, data))
    sendFuture.get(100, TimeUnit.MILLISECONDS)
    Thread.sleep(250)
  }
}