# ubuntu-development

Docker Ubuntu image for development, testing, and deployment tasks.

[![Docker Hub](https://img.shields.io/badge/Docker%20Hub-vergissberlin%2Fubuntu--development-2496ED?logo=docker&logoColor=white)](https://hub.docker.com/r/vergissberlin/ubuntu-development)
[![Docker Pulls](https://img.shields.io/docker/pulls/vergissberlin/ubuntu-development?style=flat-square)](https://hub.docker.com/r/vergissberlin/ubuntu-development)
[![Build](https://img.shields.io/github/actions/workflow/status/vergissberlin/ubuntu-development/docker-publish.yml?branch=main&style=flat-square)](https://github.com/vergissberlin/ubuntu-development/actions/workflows/docker-publish.yml)

## Supported tags

- `22.04`
- `24.04`
- `latest` (alias for `24.04`)

Version-specific tags are recommended for reproducible environments.

## Publish pipeline

Images are built and published from this repository via GitHub Actions:

- Workflow: `.github/workflows/docker-publish.yml`
- Trigger: push to `main` and manual `workflow_dispatch`
- Registry: Docker Hub `vergissberlin/ubuntu-development`

### Required repository secrets

- `DOCKERHUB_USERNAME`
- `DOCKERHUB_TOKEN`

## Usage

```bash
docker run -it vergissberlin/ubuntu-development:24.04 bash
```

```bash
docker run -it vergissberlin/ubuntu-development:22.04 bash
```

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
