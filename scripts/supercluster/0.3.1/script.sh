#!/usr/bin/env bash

MASON_NAME=supercluster
MASON_VERSION=0.3.1
MASON_HEADER_ONLY=true

. ${MASON_DIR}/mason.sh

function mason_load_source {
    mason_download \
        https://github.com/mapbox/supercluster.hpp/archive/v${MASON_VERSION}.tar.gz \
        79635c42675b7bf95486f7ef159b0766771889e7

    mason_extract_tar_gz

    export MASON_BUILD_PATH=${MASON_ROOT}/.build/supercluster.hpp-${MASON_VERSION}
}

function mason_compile {
    mkdir -p ${MASON_PREFIX}/include/
    cp -v include/*.hpp ${MASON_PREFIX}/include
    cp -v README.md LICENSE ${MASON_PREFIX}
}

function mason_cflags {
    echo "-I${MASON_PREFIX}/include"
}

function mason_ldflags {
    :
}


mason_run "$@"
