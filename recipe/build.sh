#!/usr/bin/env bash

set -exuo pipefail

# This is incompatible with rigetti::PyO3: export PYO3_USE_ABI3_FORWARD_COMPATIBILITY=1

if [[ "${target_platform}" != "${build_platform:-${target_platform}}" ]]; then
  export PKG_CONFIG_PATH=""
  export PKG_CONFIG_LIBDIR="${PREFIX}/lib/pkgconfig:${PREFIX}/share/pkgconfig"
  export PKG_CONFIG_SYSROOT_DIR="${PREFIX}"
  export PKG_CONFIG="${BUILD_PREFIX}/bin/pkg-config"

  export OPENSSL_DIR="${PREFIX}"
fi

# Build
maturin build --release --manifest-path "${SRC_DIR}"/qcs-api-client-common/Cargo.toml --out "${SRC_DIR}"/wheels

cargo-bundle-licenses --format yaml --output THIRDPARTY.yml
