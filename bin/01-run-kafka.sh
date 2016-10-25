#!/bin/bash -

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

docker-compose -f $DIR/config/docker-compose-kafka.yml \
    up --force-recreate

docker-compose -f $DIR/config/docker-compose-kafka.yml \
    rm -f
