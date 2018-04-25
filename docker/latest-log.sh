#!/usr/bin/env sh

docker logs $(docker ps --filter label=com.docker.swarm.service.name=$1 --quiet --all --latest)