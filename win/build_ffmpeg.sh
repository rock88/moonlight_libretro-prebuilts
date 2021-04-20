#!/bin/sh

INSTALL_DIR=`pwd`/ffmpeg

#rm -fr ffmpeg_tmp
#git clone https://github.com/FFmpeg/FFmpeg.git ffmpeg_tmp
cd ffmpeg_tmp

./configure --disable-everything --enable-decoder=h264 --enable-decoder=hevc --disable-programs --disable-ffmpeg \
  --disable-ffplay --disable-ffprobe --disable-doc --disable-avdevice \
  --disable-avformat --disable-swresample --disable-swscale --disable-postproc --disable-avfilter \
  --disable-iconv --disable-lzma --prefix=$INSTALL_DIR --arch=x86_64 --target-os=mingw32 --cross-prefix=x86_64-w64-mingw32.static-

make -j
make install

cd ..
#rm -fr ffmpeg_tmp
