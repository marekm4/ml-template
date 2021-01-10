#!/bin/sh

docker inspect --type=image ml:latest 1>/dev/null || docker build --tag ml:latest .
touch .bash_history

docker run \
  -it \
  -u $(id -u):$(id -g) \
  --runtime nvidia \
  --entrypoint /bin/bash \
  -p 6006:6006 \
  --rm \
  -v $(realpath .):/tf/notebooks \
  -v $(realpath .local):/home/ml/.local \
  -v $(realpath .cache):/home/ml/.cache \
  -v $(realpath .bash_history):/home/ml/.bash_history \
  ml:latest
