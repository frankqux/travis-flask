#!/bin/env bash

set -e

IMAGE="frankqux/dockerized-flask"
GIT_VERSION=$(git describe --always --abbrev --tags --long)

# Build and tag docker image.
docker build -t ${IMAGE}:${GIT_VERSION} .
docker tag ${IMAGE}:${GIT_VERSION} ${IMAGE}:latest

# Login and push image to DH.
echo "${DOCKER_PASSWORD}" | docker login -u frankqux --password-stdin
docker push ${IMAGE}:${GIT_VERSION}
