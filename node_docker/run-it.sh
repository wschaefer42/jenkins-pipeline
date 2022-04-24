#!/bin/sh
docker run --rm -v /var/run/docker.sock:/var/run/docker.sock -it node-docker:latest /bin/sh