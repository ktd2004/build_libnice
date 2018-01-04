# vim:set ts=8 sts=8 sw=8 noet:


CC := arm-hisiv400-linux-gcc
OUTPUT := $(shell pwd)/output/

HOSTOPT := arm-hisiv400-linux

export CC OUTPUT HOSTOPT


all :
	make -f Makefile.gmp
	make -f Makefile.nettle
