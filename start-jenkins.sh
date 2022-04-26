#!/bin/sh
docker run \
  --name jenkins \
  -u root \
  -p 8080:8080 \
  -p 50000:50000 \
  -d \
  -v /var/run/docker.sock:/var/run/docker.sock \
  -v jenkins_home:/var/jenkins_home \
  -v "$HOME":/home \
  --platform=linux/amd64 \
  jenkins-docker-node:1
  # jenkins/jenkins
