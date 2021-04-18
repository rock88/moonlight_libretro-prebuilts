#!/bin/sh

INSTALL_DIR=`pwd`/opus

rm -fr opus_tmp
git clone https://github.com/xiph/opus.git opus_tmp
cd opus_tmp

export CFLAGS="-mmacosx-version-min=10.12"
export ASFLAGS="-mmacosx-version-min=10.12"

./autogen.sh
./configure --enable-static --disable-shared --prefix=$INSTALL_DIR

make -j
make install

cd ..
rm -fr opus_tmp
