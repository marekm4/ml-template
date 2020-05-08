FROM tensorflow/tensorflow:latest-gpu-py3-jupyter
RUN apt-get update && apt-get install -y \
    python3-opengl \
    xvfb \
    ffmpeg
