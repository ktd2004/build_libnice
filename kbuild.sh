#!/usr/bin/env bash

## file
## brief
## details
## author TaeDong Kim <fly1004@gmail.com>
## version
## date 20180104_185632~
## copyright Copyright (C) 2018- KTD, Inc. All rights reserved.
## copyright Apache 2.0, BSD, LGPL, GPL
## note
## bug
## warning
## todo

export CUR="`pwd`"
export OUTPUT="${CUR}/output/"


export HOSTOPT="--host=arm-hisiv400-linux"
export PREFIXOPT="--prefix=${OUTPUT}"


rm -fr ${OUTPUT}


rm -fr gmp-6.1.2
if [ ! -f gmp-6.1.2.tar.bz2 ];then
    wget https://gmplib.org/download/gmp/gmp-6.1.2.tar.bz2
fi
tar xvfj gmp-6.1.2.tar.bz2

cd gmp-6.1.2
export CC=arm-hisiv400-linux-gcc
./configure ${HOSTOPT} ${PREFIXOPT} && make && make install
cd $CUR


rm -fr nettle-3.4
if [ ! -f nettle-3.4.tar.gz ];then
    wget https://ftp.gnu.org/gnu/nettle/nettle-3.4.tar.gz
fi
tar xvfz nettle-3.4.tar.gz

cd nettle-3.4
export CC=arm-hisiv400-linux-gcc
export CFLAGS="-I${OUTPUT}/include/"
export LDFLAGS="-I${OUTPUT}/lib/"
./configure ${HOSTOPT} ${PREFIXOPT} && make && make install
cd $CUR



rm -fr gnutls-3.5.16
if [ ! -f gnutls-3.5.16.tar.xz ];then
    wget https://www.gnupg.org/ftp/gcrypt/gnutls/v3.5/gnutls-3.5.16.tar.xz
fi
tar xvfJ gnutls-3.5.16.tar.xz

cd gnutls-3.5.16
export CC=arm-hisiv400-linux-gcc
export CFLAGS="-I${OUTPUT}/include/"
export LDFLAGS="-L${OUTPUT}/lib/"
export LIBS="-lhogweed -lnettle -lgmp"
./configure ${HOSTOPT} ${PREFIXOPT} --with-included-libtasn1 --with-included-unistring --without-idn --without-p11-kit
make && make install
cd $CUR
