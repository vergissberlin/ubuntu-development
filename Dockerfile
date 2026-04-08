ARG UBUNTU_VERSION=24.04
FROM ubuntu:${UBUNTU_VERSION}

RUN apt-get update && \
    apt-get upgrade -y && \
    apt-get install -y --no-install-recommends \
    bats \
    ca-certificates \
    curl \
    figlet \
    git \
    make \
    mc \
    siege \
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
    K6_VERSION="1.3.0"; \
    ARCH="$(dpkg --print-architecture)"; \
    case "${ARCH}" in \
    amd64) K6_TARGET="amd64" ;; \
    arm64) K6_TARGET="arm64" ;; \
    *) echo "Unsupported architecture for k6: ${ARCH}" && exit 1 ;; \
    esac; \
    K6_ARCHIVE="k6-v${K6_VERSION}-linux-${K6_TARGET}.tar.gz"; \
    K6_DIR="k6-v${K6_VERSION}-linux-${K6_TARGET}"; \
    curl -fsSLo "/tmp/${K6_ARCHIVE}" "https://github.com/grafana/k6/releases/download/v${K6_VERSION}/${K6_ARCHIVE}"; \
    curl -fsSLo "/tmp/k6-checksums.txt" "https://github.com/grafana/k6/releases/download/v${K6_VERSION}/checksums.txt"; \
    cd /tmp; \
    grep " ${K6_ARCHIVE}\$" k6-checksums.txt | sha256sum --check --status; \
    tar -xzf "${K6_ARCHIVE}" -C /tmp; \
    mv "/tmp/${K6_DIR}/k6" /usr/local/bin/k6; \
    chmod +x /usr/local/bin/k6; \
    rm -rf "/tmp/${K6_ARCHIVE}" "/tmp/k6-checksums.txt" "/tmp/${K6_DIR}" && \
    rm -rf /var/lib/apt/lists/*
