ARG UBUNTU_VERSION=24.04
FROM ubuntu:${UBUNTU_VERSION}

COPY scripts/git-config-global-from-env.sh /usr/local/share/ubuntu-development/git-config-global-from-env.sh

RUN apt-get update && \
    apt-get upgrade -y && \
    apt-get install -y --no-install-recommends \
    bats \
    ca-certificates \
    curl \
    fd-find \
    figlet \
    git \
    git-lfs \
    make \
    mc \
    ncurses-term \
    ripgrep \
    siege \
    tmux \
    unzip \
    wget \
    zsh && \
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
    curl -fsSLo "/tmp/${K6_ARCHIVE}" "https://github.com/grafana/k6/releases/download/v${K6_VERSION}/${K6_ARCHIVE}" && \
    curl -fsSLo "/tmp/k6-checksums.txt" "https://github.com/grafana/k6/releases/download/v${K6_VERSION}/k6-v${K6_VERSION}-checksums.txt" && \
    cd /tmp && \
    grep " ${K6_ARCHIVE}\$" k6-checksums.txt | sha256sum --check --status && \
    tar -xzf "${K6_ARCHIVE}" -C /tmp && \
    mv "/tmp/${K6_DIR}/k6" /usr/local/bin/k6 && \
    chmod +x /usr/local/bin/k6 && \
    rm -rf "/tmp/${K6_ARCHIVE}" "/tmp/k6-checksums.txt" "/tmp/${K6_DIR}" && \
    NVIM_VERSION="0.11.4"; \
    ARCH="$(dpkg --print-architecture)"; \
    case "${ARCH}" in \
    amd64) NVIM_TARGET="x86_64"; NVIM_SHA256="a74740047e73b2b380d63a474282814063d10650cd6cc95efa16d1713c7e616c" ;; \
    arm64) NVIM_TARGET="arm64"; NVIM_SHA256="684e4262d2296e469cb43f0d05edbbb52b960b7f117bed6b22936fc768993cd9" ;; \
    *) echo "Unsupported architecture for neovim: ${ARCH}" && exit 1 ;; \
    esac; \
    NVIM_ARCHIVE="nvim-linux-${NVIM_TARGET}.tar.gz"; \
    curl -fsSLo "/tmp/${NVIM_ARCHIVE}" "https://github.com/neovim/neovim/releases/download/v${NVIM_VERSION}/${NVIM_ARCHIVE}"; \
    echo "${NVIM_SHA256}  /tmp/${NVIM_ARCHIVE}" | sha256sum --check --status; \
    tar -xzf "/tmp/${NVIM_ARCHIVE}" -C /tmp; \
    cp -a "/tmp/nvim-linux-${NVIM_TARGET}/." /usr/local/; \
    ln -sf /usr/bin/fdfind /usr/local/bin/fd; \
    rm -rf /root/.config/nvim /root/.local/share/nvim /root/.local/state/nvim /root/.cache/nvim; \
    git clone --depth 1 https://github.com/AstroNvim/template /root/.config/nvim; \
    rm -rf /root/.config/nvim/.git; \
    git clone --depth 1 https://github.com/ohmyzsh/ohmyzsh.git /root/.oh-my-zsh; \
    git clone --depth 1 https://github.com/romkatv/powerlevel10k.git /root/.oh-my-zsh/custom/themes/powerlevel10k; \
    mkdir -p /root/.tmux/plugins && \
    git clone --depth 1 https://github.com/tmux-plugins/tpm /root/.tmux/plugins/tpm && \
    git clone --depth 1 https://github.com/erikw/tmux-powerline /root/.tmux/plugins/tmux-powerline; \
    usermod -s /usr/bin/zsh root && \
    rm -rf "/tmp/${NVIM_ARCHIVE}" "/tmp/nvim-linux-${NVIM_TARGET}" && \
    rm -rf /var/lib/apt/lists/*

ENV SHELL=/usr/bin/zsh
ENV LANG=C.UTF-8
ENV LC_ALL=C.UTF-8

COPY dotfiles/etc/profile.d/git-config-global-from-env.sh /etc/profile.d/git-config-global-from-env.sh
COPY dotfiles/etc/zsh/zprofile /etc/zsh/zprofile
COPY dotfiles/root/.zshrc /root/.zshrc
COPY dotfiles/root/.p10k.zsh /root/.p10k.zsh
COPY dotfiles/root/.config/git/.gitignore_global /root/.config/git/.gitignore_global
COPY dotfiles/root/.gitconfig /root/.gitconfig
COPY dotfiles/root/.tmux.conf /root/.tmux.conf
COPY dotfiles/root/.vimrc /root/.vimrc

CMD ["zsh", "-l"]
