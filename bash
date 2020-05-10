#!/bin/sh

docker inspect --type=image ml:latest 1>/dev/null || docker build --tag ml:latest .

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
  -v $(realpath .bash_history):/home/ml/.bash_history \
  ml:latest
