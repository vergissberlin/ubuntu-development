# Changelog

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
