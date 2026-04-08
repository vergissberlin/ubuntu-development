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
