#!/usr/bin/env bash

echo "Removing the API container if exists"
docker container rm -f api || true
echo "Removing the test-net network if exists"
docker network rm test-net || true

echo "Deploy app $registry:$BUILD_NUMBER"
docker network create test-net
docker container run -d --name api --net test-net $registry:$BUILD_NUMBER

# Wait until API is running
while ! docker top api; do
  sleep 0.1 # wait for 1/10 of the second before check again
  echo "Wait"
done

echo "API is running"

# Test it
docker run --net test-net -it curlimages/curl api:3000