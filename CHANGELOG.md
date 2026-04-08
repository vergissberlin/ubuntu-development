# Changelog

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
