FROM docker:stable

RUN apk update \
  && apk upgrade \
  && apk add --no-cache git bash

COPY Dockerfile.dockerize /Dockerfile.dockerize 
COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
