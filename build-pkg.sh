#!/usr/bin/env sh
set -ex
PKG="$1"
docker run --privileged --rm -v "${PWD}":/work \
  cgr.dev/chainguard/melange build pkgs/${PKG}/melange.yaml \
  --signing-key melange.rsa 
