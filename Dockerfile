ARG UBUNTU_VERSION=24.04
FROM ubuntu:${UBUNTU_VERSION}

RUN apt-get update && \
    apt-get install -y --no-install-recommends \
    bats \
    ca-certificates \
    curl \
    figlet \
    git \
    httpie \
    make \
    mc \
    siege \
    vim \
    wget && \
    if apt-cache show just >/dev/null 2>&1; then \
    apt-get install -y --no-install-recommends just; \
    else \
    JUST_VERSION="1.40.0"; \
    ARCH="$(dpkg --print-architecture)"; \
    case "${ARCH}" in \
    amd64) JUST_TARGET="x86_64-unknown-linux-musl" ;; \
    arm64) JUST_TARGET="aarch64-unknown-linux-musl" ;; \
    *) echo "Unsupported architecture for just: ${ARCH}" && exit 1 ;; \
    esac; \
    curl -fsSL "https://github.com/casey/just/releases/download/${JUST_VERSION}/just-${JUST_VERSION}-${JUST_TARGET}.tar.gz" \
    | tar -xz -C /usr/local/bin just; \
    chmod +x /usr/local/bin/just; \
    fi && \
    rm -rf /var/lib/apt/lists/*
