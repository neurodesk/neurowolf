#!/usr/bin/env sh
docker pull cgr.dev/chainguard/melange:latest
docker run --rm -v "${PWD}":/work cgr.dev/chainguard/melange keygen
