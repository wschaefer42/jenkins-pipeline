#!/usr/bin/env bash

docker rm -f api || true
docker network rm test-net || treu