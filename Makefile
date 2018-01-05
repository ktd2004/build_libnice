# vim:set ts=8 sts=8 sw=8 noet:


CC := arm-hisiv400-linux-gcc
OUTPUT := $(shell pwd)/output/

HOSTOPT := arm-hisiv400-linux

export CC OUTPUT HOSTOPT


all : build_libnice


copy_source :
	cp -af source/* .


build_gnutls : copy_source
	make -f Makefile.gmp
	make -f Makefile.nettle
	make -f Makefile.gnutls


build_glib : copy_source
	make -f Makefile.zlib
	make -f Makefile.libffi
	make -f Makefile.glib


build_libnice : build_gnutls build_glib
	make -f Makefile.libnice
