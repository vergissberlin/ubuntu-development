# Changelog

## [1.4.0](https://github.com/vergissberlin/ubuntu-development/compare/1.3.0...1.4.0) (2026-04-08)


### Features

* Add 'less' and 'tree' utilities to Dockerfile; update README.md to reflect new dependencies ([4fa1ee8](https://github.com/vergissberlin/ubuntu-development/commit/4fa1ee83e2fb706db1f367b9df75aed94ba28af8))
* Update documentation for multi-architecture Docker support and enhance CI workflows with QEMU setup for better compatibility on Apple Silicon ([fc170b0](https://github.com/vergissberlin/ubuntu-development/commit/fc170b0eba47b2cf4d44c549f1a086cffc013313))


### Chores

* Update LICENSE year to 2026 and remove obsolete pwd.stack.yml configuration file ([b53c912](https://github.com/vergissberlin/ubuntu-development/commit/b53c91247b1280d62463c829a2a1ecb10886db20))

## [1.3.0](https://github.com/vergissberlin/ubuntu-development/compare/1.2.0...1.3.0) (2026-04-08)


### Features

* Add Git LFS support in Dockerfile and update documentation to reflect new configuration options ([2f39aad](https://github.com/vergissberlin/ubuntu-development/commit/2f39aad4e1042b4ebf1e06cf0f7ef3a6e848cec1))
* Add Powerlevel10k configuration support in Dockerfile and .zshrc; update CONTRIBUTING.md with local testing instructions ([1e05ec3](https://github.com/vergissberlin/ubuntu-development/commit/1e05ec3afa678df12bf716ef809d7e34d102faa5))
* Add smoke test and vulnerability scan summaries to CI workflow for better visibility of build results ([d6ba3b1](https://github.com/vergissberlin/ubuntu-development/commit/d6ba3b10d98caa01616c6d5fd4dbb68850c69b1e))
* Add support for Git identity configuration via environment variables; update Dockerfile and documentation to reflect new features ([b914585](https://github.com/vergissberlin/ubuntu-development/commit/b9145854acf2c1dd4607d5611397b3523bc9e0d8))
* Add tmux and related plugins to Dockerfile; update README.md to include tmux documentation ([ec152ef](https://github.com/vergissberlin/ubuntu-development/commit/ec152efcdbcb24245499a07c20653242cf47cb01))
* Enhance Dockerfile and tmux configuration for improved Zsh support; update CONTRIBUTING.md with tmux usage instructions ([dc07b81](https://github.com/vergissberlin/ubuntu-development/commit/dc07b81293b366669e8554d4aa4e99a2c07710ce))
* Update Dockerfile to install Neovim and AstroNvim, enhancing development environment; update README.md and workflow to reflect changes ([3409e09](https://github.com/vergissberlin/ubuntu-development/commit/3409e09b349bd7e6cb65166e5e44afb63518b797))


### Bug Fixes

* Change exit code in Docker publish workflow from 1 to 0 to ensure successful completion of vulnerability checks ([84f9764](https://github.com/vergissberlin/ubuntu-development/commit/84f97643e7930a7335705b439d5c4e4cf68a84b7))
* Update Dockerfile to correct checksum file URL for k6 installation and streamline command chaining ([b9c0ac4](https://github.com/vergissberlin/ubuntu-development/commit/b9c0ac497c79e756fcc13e851b63e3438cdd994b))


### Code Refactoring

* Update Powerlevel10k segment separators for improved prompt aesthetics in .p10k.zsh ([fd32433](https://github.com/vergissberlin/ubuntu-development/commit/fd324337189a242641948941d39b69f6cdf0744b))


### Chores

* Enhance Dockerfile and documentation by adding k6 load testing tool and updating usage instructions in README.md ([ba99f6b](https://github.com/vergissberlin/ubuntu-development/commit/ba99f6b211cd4042bbb283f3c2ea1f6be34d841d))
* Enhance Dockerfile to include Oh My Zsh and Powerlevel10k theme; update CONTRIBUTING.md and README.md with new usage instructions ([aa51d3d](https://github.com/vergissberlin/ubuntu-development/commit/aa51d3de7fb69adee825c9a2a82e1ad5d6448b1c))
* Refactor Dockerfile to install k6 directly from GitHub releases, removing previous installation method and ensuring compatibility with multiple architectures ([88f82e3](https://github.com/vergissberlin/ubuntu-development/commit/88f82e3fc6e330b161dc6f61ccba8a50fb2db4c6))
* Replace Trivy action with direct Docker command for security scanning in CI workflow; update to latest Trivy version and improve error handling ([c20be8e](https://github.com/vergissberlin/ubuntu-development/commit/c20be8e3a4a8ecc944a25c7fbf7877195f1ec4dc))
* Update CI workflow to use latest actions/checkout and docker/setup-buildx-action versions; change exit code for vulnerability scan to ensure successful completion ([5b5be18](https://github.com/vergissberlin/ubuntu-development/commit/5b5be18051e5ba6880be8b93d5e350bd39bc3d44))
* Update CONTRIBUTING.md and README.md with Apple Silicon support details; enhance Docker publish workflow for multi-architecture builds ([2733dab](https://github.com/vergissberlin/ubuntu-development/commit/2733dab3d51d7f4cbc3cef826b3ef80d3687f242))
* Update CONTRIBUTING.md to change shell code block syntax from 'shell' to 'bash' for improved clarity ([3e22a54](https://github.com/vergissberlin/ubuntu-development/commit/3e22a54132b278936a3fdd4dd457e6aa7910cc81))
* Update Dockerfile to remove unnecessary packages and enhance security posture; add security scan step in workflow ([3650667](https://github.com/vergissberlin/ubuntu-development/commit/36506672f16bbdcbd40dc18e2d1e85f49d1795e1))
* Update documentation and scripts to use zsh as the default shell; enhance CONTRIBUTING.md and README.md with updated usage examples ([6cf590e](https://github.com/vergissberlin/ubuntu-development/commit/6cf590ec2d14d79f4be26b9c84b037e1b8fc1cf6))

## [1.2.0](https://github.com/vergissberlin/ubuntu-development/compare/1.1.0...1.2.0) (2026-04-08)

### Features

* Add support for semantic versioning tags in Docker publish workflow to enhance image versioning ([37d40ae](https://github.com/vergissberlin/ubuntu-development/commit/37d40aede77f3a8c553075eae91c591da2567536))
* Expand CONTRIBUTING.md with local validation instructions and troubleshooting tips for Docker usage ([754cb32](https://github.com/vergissberlin/ubuntu-development/commit/754cb32dfc0274691151e6ef2bff76557fad823a))

### Documentation

* Add "Try online" section to README.md with Play with Docker link for easy access to the image ([534c826](https://github.com/vergissberlin/ubuntu-development/commit/534c826b01975e30ecd2db503fcf3367b590e381))
* Enhance README.md by adding detailed descriptions for installed packages to improve clarity and usability ([3d0bd5e](https://github.com/vergissberlin/ubuntu-development/commit/3d0bd5e3090b0f57254338170a666f0b3d63b73a))
* Enhance README.md with GitHub Container Registry badges and links for improved visibility ([3ef178a](https://github.com/vergissberlin/ubuntu-development/commit/3ef178a2bea4c049670179ef0127c896f1311bcb))
* Format Docker Hub tag links in README.md for improved readability and clarity ([1cafbd8](https://github.com/vergissberlin/ubuntu-development/commit/1cafbd833dc5b9f13eb1f9909a06bd77d20eb9a4))
* Revise README.md to remove outdated publish pipeline details and add contributing section ([b9a3cea](https://github.com/vergissberlin/ubuntu-development/commit/b9a3ceae145bc13cea2cd1546a6b47f6f0d9c8ed))
* Update README.md to include additional Docker Hub pull badge for enhanced visibility ([4df5d23](https://github.com/vergissberlin/ubuntu-development/commit/4df5d2303d2aa98877b4fbcd5a243e3b948d1935))
* Update README.md to include Docker Hub tag links for versioning and compatibility ([2788050](https://github.com/vergissberlin/ubuntu-development/commit/27880505a3c2ad23dd9f1b816d45a2d9b8249609))
* Update README.md to replace Play with Docker link with Docker HOL for online image access ([e10fbf5](https://github.com/vergissberlin/ubuntu-development/commit/e10fbf54128a7e5fdb37ed1494b8e3d957bae3c0))

### Chores

* Update Docker publish workflow to use docker-container driver for improved SBOM/provenance support ([d2990a3](https://github.com/vergissberlin/ubuntu-development/commit/d2990a3e1dac5927975658a417dcb7f2b2c56729))
* Update Docker publish workflow to use latest action versions for improved stability and performance ([2ae92e0](https://github.com/vergissberlin/ubuntu-development/commit/2ae92e0ec617768e730303c048109a6a88af91c6))
* Update release-please configuration to include detailed changelog sections for better organization of release notes ([0bd9921](https://github.com/vergissberlin/ubuntu-development/commit/0bd992160eda2dfc96c62605881d1457a62545c2))

## [1.1.0](https://github.com/vergissberlin/ubuntu-development/compare/1.0.0...1.1.0) (2026-04-08)

### Features

* Add httpie and just to Dockerfile and update README.md accordingly ([4867afc](https://github.com/vergissberlin/ubuntu-development/commit/4867afc13a4206927d42253c3b915b6942c44edb))
* Add scheduled workflow for Docker image publishing every Monday at 4 AM ([8c6fff2](https://github.com/vergissberlin/ubuntu-development/commit/8c6fff2c770bef839e307c7895525d8d978715bf))
* Add support for GitHub Container Registry (GHCR) login and tagging in Docker publish workflow ([11007aa](https://github.com/vergissberlin/ubuntu-development/commit/11007aae033be44ad19d8eac5a3b96b1cea8f572))
* Update README.md with release flow details and enhance Docker publish workflow to trigger on SemVer tags ([442a0c7](https://github.com/vergissberlin/ubuntu-development/commit/442a0c747e02167d3b680b5127c6d930545efdaa))

### Bug Fixes

* Enhance Dockerfile for compatibility with Ubuntu 24.04 and refine README.md documentation ([d07b46d](https://github.com/vergissberlin/ubuntu-development/commit/d07b46d460a27ccedb513c8c62f3c83667334e40))
* Implement retry logic for Docker Hub login in publish workflow ([5b22aff](https://github.com/vergissberlin/ubuntu-development/commit/5b22aff31a423e9dfea2211143ee4d49b56dea4e))
* Improve Dockerfile by adding ca-certificates and conditional installation of just based on architecture ([e8a3864](https://github.com/vergissberlin/ubuntu-development/commit/e8a3864cae22e3cd359870db535b864da39cb125))
