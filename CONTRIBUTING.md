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

Git identity from environment (smoke check):

```bash
docker run --rm -e GIT_USER_NAME="Test User" -e GIT_USER_EMAIL="test@example.com" local/ubuntu-development:24.04 zsh -lc 'test "$(git config --global --get user.name)" = "Test User" && test "$(git config --global --get user.email)" = "test@example.com" && echo git_env_ok'
```

Testing locally with interactive:

```bash
docker build --build-arg UBUNTU_VERSION=24.04 -t local/ubuntu-development:24.04 .
docker run --rm -it local/ubuntu-development:24.04 zsh -l
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
- Powerlevel10k shows empty boxes or missing folder icons in the prompt:
  - The theme uses Nerd Font glyphs. Install a Nerd Font (e.g. [MesloLGS NF](https://github.com/romkatv/powerlevel10k/blob/master/font.md)) and set **Cursor** or your terminal to use it (e.g. setting id `terminal.integrated.fontFamily` to `MesloLGS NF` or the exact PostScript name).
- Prompt looks fine outside tmux but wrong inside tmux (slashes, underscores instead of powerline caps):
  - Rebuild the image (UTF-8 `LANG` / `LC_ALL`, `tmux-256color`, true-color hints in `dotfiles/root/.tmux.conf`). Fully quit tmux and start a new session so `$TERM` updates. The host terminal must still use a **Nerd Font**; enable true color in the client if needed (e.g. iTerm “TrueColor”, or `export COLORTERM=truecolor` before attaching).
- Apple Silicon: `platform (linux/amd64) does not match host (linux/arm64)` or `exec: "zsh": executable file not found`:
  - Prefer native arm64: `docker pull --platform linux/arm64 …` and `docker run --platform linux/arm64 …`. Ensure the tag was built with multi-arch (see `docker-publish` workflow). Using `--platform linux/amd64` forces emulation and can fail depending on the Docker backend.
