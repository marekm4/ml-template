FROM tensorflow/tensorflow:latest-gpu-py3-jupyter
RUN apt-get update && apt-get install -y \
    python3-opengl \
    xvfb \
    ffmpeg
RUN useradd -m -d /home/ml -s /bin/bash ml
