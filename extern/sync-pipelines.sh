#!/usr/bin/env sh
set -ex

OS_COMMIT="2fd2fd3dd12d763ea3722dacef28f854ab111c1e"
ARCHIVE_URL="https://github.com/wolfi-dev/os/archive/${OS_COMMIT}.tar.gz"

cd "$(dirname "$0")"
mkdir -p ../.cache
curl --output ../.cache/os.tar.gz -L "$ARCHIVE_URL"
rm -rf ../.cache/os
mkdir -p ../.cache/os
tar -xf ../.cache/os.tar.gz -C ../.cache/os --strip-components 1

rm -rf pipelines
mv ../.cache/os/pipelines pipelines
