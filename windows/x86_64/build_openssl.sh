#!/bin/sh

INSTALL_DIR=`pwd`/openssl

rm -fr openssl_tmp
git clone https://github.com/openssl/openssl.git -b OpenSSL_1_1_1-stable openssl_tmp
cd openssl_tmp

perl Configure mingw64 no-shared no-asm --prefix=$INSTALL_DIR

make
make install

cd ..
rm -fr openssl_tmp
