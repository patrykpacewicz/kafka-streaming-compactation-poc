package pl.ppac.poc.kafka.consumer

import com.typesafe.scalalogging.slf4j.LazyLogging
import ConsumerImplicit._

object Application extends App with LazyLogging with Kafka {
  logger.info("Start consuming events from kafka")
  val topic = args(0)

  logger.info("Creating kafka consumer")
  val consumer = createKafkaConsumer(createKafkaProperties())

  logger.info("Fetching all data")
  consumer.fetchAll(topic)

  logger.info("Stop consuming events from kafka")
}
