#!/usr/bin/env bash

if [ "$#" -ne 2 ]; then
    echo "Usage: $(basename "$0") <libmemcached-version> <pecl-memcached-version>"
    exit 1
fi

LIBMEMCACHED_FULL_VERSION="$1"
LIBMEMCACHED_BASE_VERSION="${1%\.*}"
PECL_MEMCACHED_VERSION="$2"

cd /tmp   && \
    rm -rf /tmp/libmemcached*   && \
    wget https://launchpad.net/libmemcached/${LIBMEMCACHED_BASE_VERSION}/${LIBMEMCACHED_FULL_VERSION}/+download/libmemcached-${LIBMEMCACHED_FULL_VERSION}.tar.gz   && \
    mkdir /tmp/libmemcached   && \
    tar xzf /tmp/libmemcached-${LIBMEMCACHED_FULL_VERSION}.tar.gz -C /tmp/libmemcached   && \
    cd /tmp/libmemcached/libmemcached-${LIBMEMCACHED_FULL_VERSION}   && \
    ./configure   && \
    make   && \
    make install   && \
    cd /tmp   && \
    rm -rf /tmp/libmemcached* /tmp/memcached*   && \
    pecl download memcached-${PECL_MEMCACHED_VERSION}   && \
    mkdir /tmp/memcached   && \
    tar xzf /tmp/memcached-${PECL_MEMCACHED_VERSION}.tgz -C /tmp/memcached   && \
    cd /tmp/memcached/memcached-${PECL_MEMCACHED_VERSION}   && \
    phpize   && \
    ./configure --enable-memcached-igbinary --enable-memcached-json   && \
    make   && \
    make install   && \
    cd /tmp   && \
    rm -rf /tmp/memcached*
