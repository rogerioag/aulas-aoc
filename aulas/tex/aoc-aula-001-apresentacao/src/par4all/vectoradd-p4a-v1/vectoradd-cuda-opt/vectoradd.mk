# A GNU makefile to run a demo of Par4All on Vector Add application excerpt
LOCAL_TARGET= vectoradd

SOURCES= $(LOCAL_TARGET:=.c)

RUN_ARG=

CLEAN_OTHERS += 

#display_cuda-opt:
#	@echo "CUDA optimisation is not yet supported"

