package pl.ppac.poc.kafka.producer

import com.typesafe.scalalogging.slf4j.LazyLogging
import pl.ppac.poc.kafka.producer.ProducerSenderImplicit._

import scala.util.Random

object Application extends App with LazyLogging with Faker with Kafka {
  logger.info("Start Producing events for kafka")
  val topic = "poc-topic"
  val ids = 1 to 10 map { i => Random.nextInt(10000) } map { "%05d".format(_) } map { "id::" + _ }

  logger.info("Creating kafka producer")
  val producer = createKafkaProducer(createKafkaProperties())

  logger.info("Sending data")
  1 to 100 foreach { i =>
    ids foreach { id =>
      val person = faker.person()
      producer.send(topic, id, ExData(id, person.fullName(), person.email()).toString)
    }
  }

  logger.info("Stop Producing events for kafka")
  producer.close()
}

case class ExData(id: String, name: String, email: String)