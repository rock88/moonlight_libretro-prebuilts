#!/bin/sh

INSTALL_DIR=`pwd`/ffmpeg

rm -fr ffmpeg_tmp
git clone https://github.com/FFmpeg/FFmpeg.git ffmpeg_tmp
cd ffmpeg_tmp

./configure --disable-everything --enable-decoder=h264 --enable-decoder=hevc --disable-programs --disable-ffmpeg \
  --disable-ffplay --disable-ffprobe --disable-doc --disable-avdevice -—disable-shared --enable-static \
  --disable-avformat --disable-swresample --disable-swscale --disable-postproc --disable-avfilter \
  --disable-iconv --disable-lzma --extra-cflags="-mmacosx-version-min=10.12" --extra-ldflags="-mmacosx-version-min=10.12" --prefix=$INSTALL_DIR

make -j
make install

cd ..
rm -fr ffmpeg_tmp
