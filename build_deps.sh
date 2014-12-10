#/bin/bash

cd third/aquila; make clean; rm -r CMakeFiles; rm CMakeCache.txt
cmake  -DENABLE_OPENGL=OFF -DBUILD_GUICHAN_OPENGL_SHARED=OFF  .; make
