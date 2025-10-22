#!/usr/bin/env sh
set -ex
PKG="$1"
docker run --privileged --rm -v "${PWD}":/work \
  cgr.dev/chainguard/melange test pkgs/${PKG}/melange.yaml ${PKG} \
  --arch x86_64,aarch64 \
  --repository-append ./packages \
  --keyring-append ./melange.rsa.pub \
  --repository-append "https://packages.wolfi.dev/os" \
  --keyring-append "https://packages.wolfi.dev/os/wolfi-signing.rsa.pub" \
  --pipeline-dirs ./extern/pipelines \
  --test-package-append wolfi-base
