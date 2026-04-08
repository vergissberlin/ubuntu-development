ARG UBUNTU_VERSION=24.04
FROM ubuntu:${UBUNTU_VERSION}

RUN apt-get update && \
    apt-get install -y --no-install-recommends \
    bats \
    curl \
    figlet \
    git \
    make \
    mc \
    siege \
    vim \
    wget && \
    rm -rf /var/lib/apt/lists/*
