#!/bin/bash -

dir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
source $dir/config/config.sh

docker-compose -f $dockerComposeConfig up --force-recreate
docker-compose -f $dockerComposeConfig rm -f
