#!/usr/bin/env bash

docker run --gpus all \
    -v /home/okashuuhei:/home/okashuuhei \
    -w=/home/okashuuhei \
    -p 8888:8888 \
    --rm -it kaggle/python-gpu-build \
    jupyter lab --no-browser --ip="0.0.0.0" --port 8888\
    --allow-root
