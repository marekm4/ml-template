#!/bin/sh

docker inspect --type=image ml:latest || docker build --tag ml:latest .

docker run \
  -it \
  -u $(id -u):$(id -g) \
  --runtime nvidia \
  --entrypoint /bin/bash \
  -p 6006:6006 \
  --rm \
  -v $(realpath .):/tf/notebooks \
  -v $(realpath .local):/.local \
  -v $(realpath .cache):/.cache \
  ml:latest
