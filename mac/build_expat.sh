#!/bin/sh

INSTALL_DIR=`pwd`/expat

rm -fr expat_tmp
git clone https://github.com/libexpat/libexpat.git expat_tmp
cd expat_tmp/expat

export CFLAGS="-mmacosx-version-min=10.12"
export ASFLAGS="-mmacosx-version-min=10.12"

./buildconf.sh
./configure --enable-static --disable-shared --prefix=$INSTALL_DIR

make -j
make install

cd ../..
rm -fr expat_tmp
