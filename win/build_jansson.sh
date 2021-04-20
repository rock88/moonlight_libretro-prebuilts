#!/bin/sh

INSTALL_DIR=`pwd`/jansson

rm -fr jansson_tmp
git clone https://github.com/akheron/jansson.git jansson_tmp
cd jansson_tmp

autoreconf -fi
./configure --host=x86_64 --enable-static --disable-shared --prefix=$INSTALL_DIR

make -j
make install

cd ..
rm -fr jansson_tmp
