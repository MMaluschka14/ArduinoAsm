INCDIR	= /usr/local/include

setup:
	cp	makeincs/Makefile.win $(INCDIR) 
	cp	makeincs/Makefile.unx $(INCDIR) 
	cp	makeincs/Makefile.mac $(INCDIR) 
	cp	makeincs/special_regs.inc  $(INCDIR) 

build:
	cd cBlink && make
	cd intBlink && make
	cd aBlink && make
	cd aBuzz && make
	cd aKernel && make

clean:
	cd cBlink && make clean
	cd intBlink && make clean
	cd aBlink && make clean
	cd aBuzz && make clean
	cd aKernel && make clean

