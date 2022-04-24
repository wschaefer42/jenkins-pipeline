#!/bin/sh
docker run \
  --name jenkins-docker \
  --rm \
  --platform=linux/amd64 \
  --detach \
  --privileged \
  --network jenkins \
  --network-alias docker \
  --publish 2376:2376 \
  --env DOCKER_TLS_CERTDIR=/certs \
  --volume jenkins-docker-certs:/certs/client \
  --volume jenkins-data:/var/jenkins_home \
  docker:dind \
    --storage-driver overlay2

docker run \
  --name jenkins \
  --rm \
  --platform=linux/amd64 \
  --user root \
  --detach \
  --privileged \
  --network jenkins \
  --network-alias docker \
  --publish 2376:2376 \
  --volume jenkins-data:/var/jenkins_home \
  --volumne /var/run/docker.sock:/var/run/docker.sock \
  --volumne "$HOME":/home \

  jenkinsci/blueocean
