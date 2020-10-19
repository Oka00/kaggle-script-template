#!/usr/bin/env bash

#  jupyter labextension install @jupyterlab/toc \
# は時間がかかるのでいつかなんとかする
docker run \
    -v /home/okashuuhei:/home/okashuuhei \
    -w=/home/okashuuhei \
    -p 8888:8888 \
    --rm -it kaggle/python-build \
    ipython
