#!/bin/zsh

docker rm -f api || true
docker network rm test-net || treu