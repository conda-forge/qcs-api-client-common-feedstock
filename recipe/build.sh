#!/usr/bin/env bash

set -exuo pipefail

export PYO3_USE_ABI3_FORWARD_COMPATIBILITY=1
export OPENSSL_DIR=${PREFIX}/lib

# Build
maturin build --release --manifest-path "${SRC_DIR}"/qcs-api-client-common/Cargo.toml --out "${SRC_DIR}"/wheels

cargo-bundle-licenses --format yaml --output THIRDPARTY.yml
