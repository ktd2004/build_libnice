# vim:set ts=8 sts=8 sw=8 noet:


CC := arm-hisiv400-linux-gcc
OUTPUT := $(shell pwd)/output/

HOSTOPT := arm-hisiv400-linux

export CC OUTPUT HOSTOPT


all : build_gnutls build_glib


build_gnutls :
	#make -f Makefile.gmp
	#make -f Makefile.nettle
	#make -f Makefile.gnutls


build_glib :
	make -f Makefile.zlib
	make -f Makefile.libffi
