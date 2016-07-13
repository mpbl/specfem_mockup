MPICXX = mpic++
CXXFLAGS = -I${BOOST_INC} -O3 -std=c++0x

UNAME_S := $(shell uname -s)
ifeq ($(UNAME_S),Linux)
	LDFLAGS = -L${BOOST_LIB} -lboost_mpi -lboost_filesystem -lboost_system
endif
ifeq ($(UNAME_S),Darwin)
	LDFLAGS = ${BOOST_LIB} -lboost_mpi-mt -lboost_filesystem-mt -lboost_system-mt
endif

all: specfem_mockup

specfem_mockup: src/specfem_mockup.cpp
	mkdir -p bin
	$(MPICXX) -o bin/$@ $^ ${CXXFLAGS} ${LDFLAGS}

clean: 
	rm bin/specfem_mockup
