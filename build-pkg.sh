#!/usr/bin/env sh
set -ex
PKG="$1"
docker run --privileged --rm -v "${PWD}":/work \
  cgr.dev/chainguard/melange build pkgs/${PKG}/melange.yaml \
  --arch x86_64,aarch64 \
  --namespace neurowolf \
  --license 'Apache-2.0' \
  --git-repo-url 'https://github.com/neurodesk/neurowolf' \
  --repository-append ./packages \
  --keyring-append ./melange.rsa.pub \
  --repository-append "https://packages.wolfi.dev/os" \
  --keyring-append "https://packages.wolfi.dev/os/wolfi-signing.rsa.pub" \
  --pipeline-dir ./extern/pipelines \
  --signing-key melange.rsa
