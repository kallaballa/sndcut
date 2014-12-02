TARGET  := sndcut

ifdef JAVASCRIPT
TARGET := sndcut.html
endif

SRCS  := sndcut.cpp
CXXFLAGS += `pkg-config --cflags sndfile`
LIBS += `pkg-config --libs sndfile` -lboost_program_options
LDFLAGS += 

#precompiled headers
HEADERS := 

GCH     := ${HEADERS:.h=.gch}
OBJS    := ${SRCS:.cpp=.o} 
DEPS    := ${SRCS:.cpp=.dep} 

.PHONY: all release debug clean distclean 

all: release
release: ${TARGET}
debug: ${TARGET}
info: ${TARGET}
profile: ${TARGET}
hardcore: ${TARGET}

${TARGET}: ${OBJS} 
	${CXX} ${LDFLAGS} -o $@ $^ ${LIBS} 

${OBJS}: %.o: %.cpp %.dep ${GCH}
	${CXX} ${CXXFLAGS} -o $@ -c $< 

${DEPS}: %.dep: %.cpp Makefile 
	${CXX} ${CXXFLAGS} -MM $< > $@ 

${GCH}: %.gch: ${HEADERS} 
	${CXX} ${CXXFLAGS} -o $@ -c ${@:.gch=.h}

install:
	mkdir -p ${DESTDIR}/${PREFIX}/bin
	cp ${TARGET} ${DESTDIR}/${PREFIX}/bin

uninstall:
	rm ${DESTDIR}/${PREFIX}/bin/${TARGET}

clean:
	rm -f *~ ${DEPS} ${OBJS} ${GCH} ${TARGET} 

distclean: clean



