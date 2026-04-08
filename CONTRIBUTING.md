# Contributing

Thanks for contributing to `ubuntu-development`.

## Publish pipeline

Images are built and published from this repository via GitHub Actions:

- Release orchestration: `.github/workflows/release-please.yml`
- Publish workflow: `.github/workflows/docker-publish.yml`
- Trigger: push to `main`, SemVer tags (`*.*.*`), scheduled run, and manual `workflow_dispatch`
- Registries:
  - Docker Hub: `vergissberlin/ubuntu-development`
  - GitHub Container Registry: `ghcr.io/vergissberlin/ubuntu-development`

## Release flow

1. Merge Conventional Commit changes into `main`.
2. Release Please updates or creates a release PR with version bump metadata and `CHANGELOG.md`.
3. Merge the release PR to create a GitHub Release and tag (`X.Y.Z`).
4. The Docker publish workflow runs on that tag and publishes release images for the default Ubuntu version.

`CHANGELOG.md` is maintained automatically from Conventional Commit history.

## Required repository secrets

- `DOCKERHUB_USERNAME`
- `DOCKERHUB_TOKEN`

Note: GHCR publishing uses `GITHUB_TOKEN` from GitHub Actions.

## Local validation

Run local checks before opening a PR:

```bash
docker build --build-arg UBUNTU_VERSION=22.04 -t local/ubuntu-development:22.04 .
docker run --rm local/ubuntu-development:22.04 zsh -lc "echo $USER && test -d /root/.oh-my-zsh && echo omz_ok && zsh --version && git --version && curl --version && just --version && bats --version"
```

```bash
docker build --build-arg UBUNTU_VERSION=24.04 -t local/ubuntu-development:24.04 .
docker run --rm local/ubuntu-development:24.04 zsh -lc "echo $USER && test -d /root/.oh-my-zsh && echo omz_ok && zsh --version && git --version && curl --version && just --version && bats --version"
```

## Registry usage

- Docker Hub image: `vergissberlin/ubuntu-development:<tag>`
- GHCR image: `ghcr.io/vergissberlin/ubuntu-development:<tag>`

Examples:

```bash
docker pull vergissberlin/ubuntu-development:24.04
docker run -it vergissberlin/ubuntu-development:24.04 zsh
```

```bash
docker pull ghcr.io/vergissberlin/ubuntu-development:24.04
docker run -it ghcr.io/vergissberlin/ubuntu-development:24.04 zsh
```

## Troubleshooting

- Docker Hub login fails in CI:
  - Verify `DOCKERHUB_USERNAME` and `DOCKERHUB_TOKEN` secrets in repository settings.
- GHCR push fails with permission errors:
  - Confirm workflow permissions include `packages: write`.
- `latest` tag update fails:
  - Ensure the default Ubuntu tag (`24.04`) was successfully published first.
- `no matching manifest for linux/arm64` on Apple Silicon:
  - Prefer a tag built with multi-arch (`linux/amd64` + `linux/arm64`). Until that image exists, use `docker run --platform linux/amd64 ...` as a workaround.
- `exec: "zsh": executable file not found`:
  - The image must include the `zsh` package (see `Dockerfile`). Rebuild locally or wait for a new publish after that change merged.
