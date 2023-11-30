ARG BASE_IMAGE=nvcr.io/nvidia/l4t-base:r32.7.1

FROM ${BASE_IMAGE}

RUN apt-get update && \
    apt-get install -y --no-install-recommends \
    git \
    cmake \
    vim \
    build-essential \
    curl \
    wget \
    && rm -rf /var/lib/apt/lists/*

RUN groupadd jetson
RUN useradd \
    -g jetson \
    --home-dir /home/jetson \
    --create-home \
    --shell /bin/bash \
    jetson

RUN mkdir /home/jetson/projects

USER jetson

WORKDIR /home/jetson

CMD ["bash"]

