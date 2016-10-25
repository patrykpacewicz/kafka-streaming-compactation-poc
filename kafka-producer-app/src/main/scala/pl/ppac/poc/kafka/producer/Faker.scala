package pl.ppac.poc.kafka.producer

import io.codearte.jfairy.Fairy

trait Faker {
  val faker = Fairy.create()
}
