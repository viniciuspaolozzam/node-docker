#!/bin/bash

docker-machine version
docker-machine create clusterNode --virtualbox-memory 2024 --virtualbox-cpu-count 2 --virtualbox-disk-size 10000 -d virtualbox
docker-machine env clusterNode

eval $(docker-machine env clusterNode)
docker ps