# Makefile for example Arduino projects
# 	This build system assumes all tools are available on the system PATH
# 	It should work without modification on Mac, Linux, or PC systems.
# 	
build:
	cd cBlink && make
	cd aIntBlink && make
	cd aBlink && make
	cd aBuzz && make
	cd aKernel && make
	cd cButton && make
	cd aButton && make

clean:
	cd cBlink && make clean
	cd aBlink && make clean
	cd aIntBlink && make clean
	cd aBuzz && make clean
	cd aKernel && make clean
	cd cButton && make clean
	cd aButton && make clean
