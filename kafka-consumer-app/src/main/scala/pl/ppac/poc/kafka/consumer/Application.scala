package pl.ppac.poc.kafka.consumer

import com.typesafe.scalalogging.slf4j.LazyLogging
import org.apache.kafka.clients.consumer.KafkaConsumer

object Application extends App with LazyLogging {
  logger.info("Start consumming")
}
