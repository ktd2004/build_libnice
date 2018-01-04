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

export CC=arm-hisiv400-linux-gcc

export HOSTOPT="--host=arm-hisiv400-linux"
export PREFIXOPT="--prefix=${OUTPUT}"


rm -fr ${OUTPUT}


rm -fr gmp-6.1.2
if [ ! -f gmp-6.1.2.tar.bz2 ];then
    wget https://gmplib.org/download/gmp/gmp-6.1.2.tar.bz2
fi
tar xvfj gmp-6.1.2.tar.bz2

cd gmp-6.1.2
./configure ${HOSTOPT} ${PREFIXOPT} && make && make install
cd $CUR


rm -fr nettle-3.4
if [ ! -f nettle-3.4.tar.gz ];then
    wget https://ftp.gnu.org/gnu/nettle/nettle-3.4.tar.gz
fi
tar xvfz nettle-3.4.tar.gz

cd nettle-3.4
./configure ${HOSTOPT} ${PREFIXOPT} && make && make install
cd $CUR
