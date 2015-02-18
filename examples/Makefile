# Generic Makefile for PARI programs -- i686 running mingw (ix86/GMP-5.1.3 kernel) 32-bit version
#
#  This file was created by Configure. Any change made to it will be
#  lost when Configure is run.
#
# make all will create
#  extgcd-dyn (linked dynamically with libpari)
#  extgcd-sta (linked statically)
#  libextgcd.so (to be used by "install" under GP)
#
# Under GP: install("extgcd", "GG&&", "gcdex", "./libextgcd.so") enables
# you to subsequently use gcdex to call extgcd (see the reference manual).
#

# change this TARGET to compile your own programs
TARGET = extgcd
SHELL  = /bin/sh

DBGFLAGS   = -g -Wall
CFLAGS     = -O3 -Wall -fno-strict-aliasing
EXTRACFLAGS=
#CFLAGS    = $(DBGFLAGS)

# Various linkers use different flags to force static compilation. Choose
# the one which is relevant for your installation.
#
# Solaris ld (global)
#STATIC    = -dn

# Solaris ld (toggle: no shared object accepted until -B dynamic is seen
#STATIC    = -B static

# gcc
#STATIC    = -static

CC         = i686-w64-mingw32-gcc
CPPFLAGS   = -I. -I/home/bill/pari-2.7.2/mingw/include
LD         = i686-w64-mingw32-gcc
LDFLAGS    = -O3 -Wall -fno-strict-aliasing    -Wl,--enable-auto-import 
MODLD      = i686-w64-mingw32-gcc
MODLDFLAGS = -shared  $(CFLAGS) $(DLCFLAGS)  
EXTRAMODLDFLAGS = -L/home/bill/pari-2.7.2/mingw/bin -lpari -Wl,--enable-auto-import
EXTRALIBS  =

RUNPTH     = -Wl,-rpath "/home/bill/pari-2.7.2/mingw/bin"
DLCFLAGS   = 
LIBS       = -lm -L/home/bill/pari-2.7.2/mingw/bin -lpari

RM = rm -f


OBJS = $(TARGET).o
DYN = lib$(TARGET).dll
ALL = $(TARGET)-sta $(TARGET)-dyn $(DYN)

dft: $(TARGET)-dyn

all: $(ALL)

sta: $(TARGET)-sta

dyn: $(TARGET)-dyn

dynlib: $(DYN)

$(DYN): $(OBJS)
	$(MODLD) -o $@ $(MODLDFLAGS) $(EXTRACFLAGS) $(OBJS) $(EXTRAMODLDFLAGS)

$(TARGET)-sta: $(OBJS)
	$(LD) -o $@ $(LDFLAGS) $(EXTRACFLAGS) $< $(EXTRALIBS) $(STATIC) $(LIBS)

$(TARGET)-dyn: $(OBJS)
	$(LD) -o $@ $(LDFLAGS) $(EXTRACFLAGS) $< $(EXTRALIBS) $(RUNPTH) $(LIBS)

%.o: %.c
	$(CC) -c $(CFLAGS) $(EXTRACFLAGS) $(CPPFLAGS) $(DLCFLAGS) $<
clean:
	-$(RM) *.o $(ALL)
