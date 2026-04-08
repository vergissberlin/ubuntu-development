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
    JUST_ARCHIVE="just-${JUST_VERSION}-${JUST_TARGET}.tar.gz"; \
    curl -fsSLo "/tmp/${JUST_ARCHIVE}" "https://github.com/casey/just/releases/download/${JUST_VERSION}/${JUST_ARCHIVE}"; \
    curl -fsSLo "/tmp/SHA256SUMS" "https://github.com/casey/just/releases/download/${JUST_VERSION}/SHA256SUMS"; \
    cd /tmp; \
    grep "  ${JUST_ARCHIVE}\$" SHA256SUMS | sha256sum --check --status; \
    tar -xzf "${JUST_ARCHIVE}" -C /usr/local/bin just; \
    rm -f "/tmp/${JUST_ARCHIVE}" "/tmp/SHA256SUMS"; \
    chmod +x /usr/local/bin/just; \
    fi && \
    rm -rf /var/lib/apt/lists/*
