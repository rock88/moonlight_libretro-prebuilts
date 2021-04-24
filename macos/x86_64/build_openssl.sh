#!/bin/sh

INSTALL_DIR=`pwd`/openssl

rm -fr openssl_tmp
git clone https://github.com/openssl/openssl.git -b OpenSSL_1_1_1-stable openssl_tmp
cd openssl_tmp

export CFLAGS="-mmacosx-version-min=10.12"
export ASFLAGS="-mmacosx-version-min=10.12"

./config -static --prefix=$INSTALL_DIR

make -j
make install

cd ..
rm -fr openssl_tmp
