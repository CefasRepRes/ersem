#
# Makefile to build ERSEM models
#

include ../../../Rules.make

DOCSRC	= base.F90 nutrients.F90 dom.F90 pom.F90 oxygen.F90 carbonate.F90 vphyt.F90 microzoo.F90 mesozoo.F90 bacteria.F90 benthic_pom.F90 light.F90 calcification.F90

OBJS    = ${LIBFABM}(nutrients.o) ${LIBFABM}(dom.o) ${LIBFABM}(pom.o) ${LIBFABM}(oxygen.o) ${LIBFABM}(carbonate.o) ${LIBFABM}(vphyt.o) ${LIBFABM}(microzoo.o) ${LIBFABM}(mesozoo.o) ${LIBFABM}(bacteria.o) ${LIBFABM}(benthic_pom.o) ${LIBFABM}(light.o) ${LIBFABM}(calcification.o)

all: objs

${OBJS}: $(FABMBASE) ${LIBFABM}(base.o)

${LIBFABM}(base.o): $(FABMBASE)

objs: ${OBJS}
	$(MOVE_MODULES_COMMAND)

doc:    $(DOCSRC)
	$(PROTEX) $(DOCSRC) > ../../../../doc/pml_ersem.tex

clean:
	$(RM) *.o *~

#-----------------------------------------------------------------------
# Copyright (C) 2011 - Jorn Bruggeman (BB)                             !
#-----------------------------------------------------------------------
