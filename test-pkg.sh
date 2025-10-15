#!/usr/bin/env sh
set -ex
PKG="$1"
docker run --privileged --rm -v "${PWD}":/work \
  cgr.dev/chainguard/melange test pkgs/${PKG}/melange.yaml ${PKG} \
  --repository-append /work/packages \
  --keyring-append /work/melange.rsa.pub \
  --repository-append https://packages.wolfi.dev/os \
  --keyring-append https://packages.wolfi.dev/os/wolfi-signing.rsa.pub
