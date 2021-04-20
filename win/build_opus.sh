#!/bin/sh

INSTALL_DIR=`pwd`/opus

rm -fr opus_tmp
git clone https://github.com/xiph/opus.git opus_tmp
cd opus_tmp

./autogen.sh
./configure --host=x86_64 --enable-static --disable-shared --prefix=$INSTALL_DIR

make -j
make install

cd ..
rm -fr opus_tmp
