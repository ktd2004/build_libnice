# vim:set ts=8 sts=8 sw=8 noet:


CC := arm-hisiv400-linux-gcc
OUTPUT := $(shell pwd)/output/

HOSTOPT := "--host=arm-hisiv400-linux"
PREFIXOPT := "--prefix=${OUTPUT}"


export CC OUTPUT HOSTOPT PREFIXOPT



all :
	make -f Makefile.gmp
