#CC=clang --target=arm-$(CROSS_COMPILE)

code_root=./
include neowaytools/neoway.mk


all:example

EXAMPLE_DIR=$(shell ls -d example/*)
EXAMPLE_DIR_CLEAN=$(shell ls -d example/*)

.PHONY:$(EXAMPLE_DIR)
example: $(EXAMPLE_DIR)

$(EXAMPLE_DIR): 
	make -C $@

