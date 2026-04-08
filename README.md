# ubuntu-development

Docker Ubuntu image for development, testing, and deployment tasks.

[![Build](https://img.shields.io/github/actions/workflow/status/vergissberlin/ubuntu-development/docker-publish.yml?branch=main&style=flat-square)](https://github.com/vergissberlin/ubuntu-development/actions/workflows/docker-publish.yml)
[![Docker Hub](https://img.shields.io/badge/Docker%20Hub-vergissberlin%2Fubuntu--development-2496ED?logo=docker&logoColor=white)](https://hub.docker.com/r/vergissberlin/ubuntu-development)
[![Docker Pulls](https://img.shields.io/docker/pulls/vergissberlin/ubuntu-development?style=flat-square)](https://hub.docker.com/r/vergissberlin/ubuntu-development)
[![GHCR](https://img.shields.io/badge/GHCR-ghcr.io%2Fvergissberlin%2Fubuntu--development-181717?logo=github&logoColor=white)](https://github.com/vergissberlin/ubuntu-development/pkgs/container/ubuntu-development)
[![Docker HOL](https://img.shields.io/badge/Try%20Online-Docker%20HOL-2496ED?style=flat-square&logo=docker&logoColor=white)](https://dockerhol.com/)

## Supported tags

- `22.04`
- `24.04`
- `latest` (alias for `24.04`)
- `<x.y.z>` (Release Please SemVer tags, for example `1.2.3`)

Version-specific tags are recommended for reproducible environments.

## Usage

```bash
docker run -it vergissberlin/ubuntu-development:24.04 bash
```

```bash
docker run -it vergissberlin/ubuntu-development:22.04 bash
```

```bash
docker run -it ghcr.io/vergissberlin/ubuntu-development:24.04 bash
```

```bash
docker run -it ghcr.io/vergissberlin/ubuntu-development:latest bash
```

### Try online

Launch a browser-based Docker playground via Docker HOL:

[Open Docker HOL](https://dockerhol.com/)

Alternative: use [GitHub Codespaces](https://docs.github.com/en/codespaces) for a full cloud development environment.

## Installed packages

- `bash`
- `bats`
- `curl`
- `figlet`
- `git`
- `httpie`
- `just`
- `make`
- `mc`
- `siege`
- `vim`
- `wget`

## Docker registry

[Docker Hub repository](https://hub.docker.com/r/vergissberlin/ubuntu-development/)
[GitHub Container Registry package](https://github.com/vergissberlin/ubuntu-development/pkgs/container/ubuntu-development)

### Tag links on Docker Hub

| Tag                                                                                    | Description                                                   |
|----------------------------------------------------------------------------------------|---------------------------------------------------------------|
| [`24.04`](https://hub.docker.com/r/vergissberlin/ubuntu-development/tags?name=24.04)   | Recommended default image for current Ubuntu LTS development. |
| [`latest`](https://hub.docker.com/r/vergissberlin/ubuntu-development/tags?name=latest) | Alias that currently points to `24.04`.                       |
| [`22.04`](https://hub.docker.com/r/vergissberlin/ubuntu-development/tags?name=22.04)   | Previous Ubuntu LTS image for compatibility scenarios.        |
| [`x.y.z` release tags](https://hub.docker.com/r/vergissberlin/ubuntu-development/tags) | Immutable SemVer releases published from Git tags.            |

## Similar images

- alpine-development: [git][10], [docker][15]
- centos-development: [git][20], [docker][25]
- debian-development: [git][30], [docker][35]
- fedora-development: [git][40], [docker][45]
- opensuse-development: [git][50], [docker][55]

[10]: https://github.com/vergissberlin/alpine-development
[15]: https://hub.docker.com/r/vergissberlin/alpine-development/
[20]: https://github.com/vergissberlin/centos-development
[25]: https://hub.docker.com/r/vergissberlin/centos-development/
[30]: https://github.com/vergissberlin/debian-development
[35]: https://hub.docker.com/r/vergissberlin/debian-development/
[40]: https://github.com/vergissberlin/fedora-development
[45]: https://hub.docker.com/r/vergissberlin/fedora-development/
[50]: https://github.com/vergissberlin/opensuse-development
[55]: https://hub.docker.com/r/vergissberlin/opensuse-development/

---

## Contributing

Contribution and release details are documented in [`CONTRIBUTING.md`](CONTRIBUTING.md).

### Local validation quickstart

```bash
docker build --build-arg UBUNTU_VERSION=24.04 -t local/ubuntu-development:24.04 .
docker run --rm local/ubuntu-development:24.04 bash -lc "git --version && just --version && bats --version"
```
