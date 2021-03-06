#!/usr/bin/env bash

MASON_NAME=variant
MASON_VERSION=1.1.5
MASON_HEADER_ONLY=true

. ${MASON_DIR}/mason.sh

function mason_load_source {
    mason_download \
        https://github.com/mapbox/variant/archive/v${MASON_VERSION}.tar.gz \
    a9879b5c6c05746309f49024da299c2521dda2b2
    mason_extract_tar_gz

    export MASON_BUILD_PATH=${MASON_ROOT}/.build/variant-${MASON_VERSION}
}

function mason_compile {
    mkdir -p ${MASON_PREFIX}/include/
    cp -r include/mapbox ${MASON_PREFIX}/include/mapbox
    cp -v README.md LICENSE ${MASON_PREFIX}
}

function mason_cflags {
    echo -isystem ${MASON_PREFIX}/include -I${MASON_PREFIX}/include
}

function mason_ldflags {
    :
}

function mason_static_libs {
    :
}

mason_run "$@"
