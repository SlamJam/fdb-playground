#!/usr/bin/env bash

set -euo pipefail

SRC_PATH=${1:?"path to FoundationDB source is required"}
ROOT_PATH=$(pwd)

# For Debug
# BUILD_PATH="${ROOT_PATH}/build"
# mkdir -p "${BUILD_PATH}"
BUILD_PATH=$(mktemp -d '/tmp/foooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooundationdb-build.XXXXXXXXXX')


pushd "${SRC_PATH}"
git reset --hard
git checkout "${FDB_VERSION}"

git apply "${ROOT_PATH}/patches/patch-"*
popd

pushd "${BUILD_PATH}"
cmake \
    -DCMAKE_BUILD_TYPE=Release \
    -G Ninja \
    -DCMAKE_C_COMPILER=/usr/bin/clang \
    -DCMAKE_CXX_COMPILER=/usr/bin/clang++ \
    -Wno-dev \
    -DUSE_CCACHE=on \
    -USE_LD=lld \
    -DWITH_CONTRIB=off \
    -DWITH_FLOWBENCH=off \
    -DWITH_C_BINDING=off \
    -DFDB_RELEASE=1 \
    "${SRC_PATH}"

echo "Run ${NPROC} jobs in parallel (0 means infinity)"
cmake --build . -- -j "${NPROC}"
cpack -G RPM
popd

cp "${BUILD_PATH}"/packages/*.rpm ./packages/
