#!/bin/sh

set -e

EXECUTABLE_PATH=$1
TAG=$2
DOCKERFILE_PATH=$3
DOCKER_FILE_TO_USE="/Dockerfile"

if [ -z $EXECUTABLE_PATH ]; then
  echo '<executablePath> parameter is missing'
  exit 1
fi

if [ -z $TAG ]; then
  echo '<tag> parameter is missing'
  exit 1
fi

if [ -n "$DOCKERFILE_PATH" ]; then
  if [ -f $DOCKERFILE_PATH ] ; then
    echo "Dockerfile found"
    DOCKER_FILE_TO_USE=$DOCKERFILE_PATH
  else
    echo "Imposible to find Dockerfile at path : $DOCKERFILE_PATH"
    exit 1
  fi
fi

chmod u+x $EXECUTABLE_PATH
docker build . -f $DOCKER_FILE_TO_USE -t $TAG --build-arg EXECUTABLE_PATH=$EXECUTABLE_PATH

echo ::set-output name=image::$TAG