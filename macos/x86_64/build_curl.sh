#!/bin/sh

INSTALL_DIR=`pwd`/curl
OPENSSL_DIR=`pwd`/openssl

rm -fr curl_tmp
git clone https://github.com/curl/curl.git curl_tmp
cd curl_tmp

export CFLAGS="-mmacosx-version-min=10.12"
export ASFLAGS="-mmacosx-version-min=10.12"

autoreconf -fi
./configure --enable-static --disable-ldap --without-librtmp --disable-rtsp --without-zlib --without-zstd --without-libidn2 --without-brotli --without-nghttp2 --disable-shared --prefix=$INSTALL_DIR --with-ssl=$OPENSSL_DIR

make -j
make install

cd ..
rm -fr curl_tmp
