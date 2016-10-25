package pl.ppac.poc.kafka.consumer

import com.typesafe.scalalogging.slf4j.LazyLogging
import org.apache.kafka.clients.consumer.{ConsumerRecord, ConsumerRecords, KafkaConsumer}

import scala.collection.JavaConverters._

object ConsumerImplicit {
  implicit def producerSend(consumer: KafkaConsumer[String, String]): ConsumerImplicit = new ConsumerImplicit(consumer)
}

class ConsumerImplicit(consumer: KafkaConsumer[String, String]) extends LazyLogging {
  def fetchAll(topic: String): Unit = {

    consumer.subscribe(List(topic).asJava)

    var doRun = true

    while (doRun) {
      Thread.sleep(500)
      val records: ConsumerRecords[String, String] = consumer.poll(1000)

      records.asScala.foreach { (rec: ConsumerRecord[String, String]) =>
        val key = rec.key()
        val data = rec.value()
        val offset = rec.offset()
        val top = rec.topic()
        logger.info(s"Received {topic: $top, offset: $offset, key: $key, data: $data}")
      }

      logger.info(s"Records count: ${records.count()}")
      doRun = records.count() != 0
    }
  }
}