#!/bin/sh

INSTALL_DIR=`pwd`/jansson

rm -fr jansson_tmp
git clone https://github.com/akheron/jansson.git jansson_tmp
cd jansson_tmp

export CFLAGS="-mmacosx-version-min=10.12"
export ASFLAGS="-mmacosx-version-min=10.12"

autoreconf -fi
./configure --enable-static --disable-shared --prefix=$INSTALL_DIR

make -j
make install

cd ..
rm -fr jansson_tmp
