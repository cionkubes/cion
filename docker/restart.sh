#!/usr/bin/env sh

docker service ls --format "{{.Name}}" | grep ${1:-cion} | xargs -i docker service update {} --force ${@:2}