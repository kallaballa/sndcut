# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.0

#=============================================================================
# Special targets provided by cmake.

# Disable implicit rules so canonical targets will work.
.SUFFIXES:

# Remove some rules from gmake that .SUFFIXES does not remove.
SUFFIXES =

.SUFFIXES: .hpux_make_needs_suffix_list

# Suppress display of executed commands.
$(VERBOSE).SILENT:

# A target that is always out of date.
cmake_force:
.PHONY : cmake_force

#=============================================================================
# Set environment variables for the build.

# The shell in which to execute make rules.
SHELL = /bin/sh

# The CMake executable.
CMAKE_COMMAND = /usr/bin/cmake

# The command to remove a file.
RM = /usr/bin/cmake -E remove -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /home/elchaschab/devel/sndcut-1.0/third/aquila

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/elchaschab/devel/sndcut-1.0/third/aquila

# Include any dependencies generated for this target.
include examples/wave_info/CMakeFiles/wave_info.dir/depend.make

# Include the progress variables for this target.
include examples/wave_info/CMakeFiles/wave_info.dir/progress.make

# Include the compile flags for this target's objects.
include examples/wave_info/CMakeFiles/wave_info.dir/flags.make

examples/wave_info/CMakeFiles/wave_info.dir/wave_info.cpp.o: examples/wave_info/CMakeFiles/wave_info.dir/flags.make
examples/wave_info/CMakeFiles/wave_info.dir/wave_info.cpp.o: examples/wave_info/wave_info.cpp
	$(CMAKE_COMMAND) -E cmake_progress_report /home/elchaschab/devel/sndcut-1.0/third/aquila/CMakeFiles $(CMAKE_PROGRESS_1)
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Building CXX object examples/wave_info/CMakeFiles/wave_info.dir/wave_info.cpp.o"
	cd /home/elchaschab/devel/sndcut-1.0/third/aquila/examples/wave_info && /usr/bin/c++   $(CXX_DEFINES) $(CXX_FLAGS) -o CMakeFiles/wave_info.dir/wave_info.cpp.o -c /home/elchaschab/devel/sndcut-1.0/third/aquila/examples/wave_info/wave_info.cpp

examples/wave_info/CMakeFiles/wave_info.dir/wave_info.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/wave_info.dir/wave_info.cpp.i"
	cd /home/elchaschab/devel/sndcut-1.0/third/aquila/examples/wave_info && /usr/bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -E /home/elchaschab/devel/sndcut-1.0/third/aquila/examples/wave_info/wave_info.cpp > CMakeFiles/wave_info.dir/wave_info.cpp.i

examples/wave_info/CMakeFiles/wave_info.dir/wave_info.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/wave_info.dir/wave_info.cpp.s"
	cd /home/elchaschab/devel/sndcut-1.0/third/aquila/examples/wave_info && /usr/bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -S /home/elchaschab/devel/sndcut-1.0/third/aquila/examples/wave_info/wave_info.cpp -o CMakeFiles/wave_info.dir/wave_info.cpp.s

examples/wave_info/CMakeFiles/wave_info.dir/wave_info.cpp.o.requires:
.PHONY : examples/wave_info/CMakeFiles/wave_info.dir/wave_info.cpp.o.requires

examples/wave_info/CMakeFiles/wave_info.dir/wave_info.cpp.o.provides: examples/wave_info/CMakeFiles/wave_info.dir/wave_info.cpp.o.requires
	$(MAKE) -f examples/wave_info/CMakeFiles/wave_info.dir/build.make examples/wave_info/CMakeFiles/wave_info.dir/wave_info.cpp.o.provides.build
.PHONY : examples/wave_info/CMakeFiles/wave_info.dir/wave_info.cpp.o.provides

examples/wave_info/CMakeFiles/wave_info.dir/wave_info.cpp.o.provides.build: examples/wave_info/CMakeFiles/wave_info.dir/wave_info.cpp.o

# Object files for target wave_info
wave_info_OBJECTS = \
"CMakeFiles/wave_info.dir/wave_info.cpp.o"

# External object files for target wave_info
wave_info_EXTERNAL_OBJECTS =

examples/wave_info/wave_info: examples/wave_info/CMakeFiles/wave_info.dir/wave_info.cpp.o
examples/wave_info/wave_info: examples/wave_info/CMakeFiles/wave_info.dir/build.make
examples/wave_info/wave_info: libAquila.a
examples/wave_info/wave_info: lib/libOoura_fft.a
examples/wave_info/wave_info: examples/wave_info/CMakeFiles/wave_info.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --red --bold "Linking CXX executable wave_info"
	cd /home/elchaschab/devel/sndcut-1.0/third/aquila/examples/wave_info && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/wave_info.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
examples/wave_info/CMakeFiles/wave_info.dir/build: examples/wave_info/wave_info
.PHONY : examples/wave_info/CMakeFiles/wave_info.dir/build

examples/wave_info/CMakeFiles/wave_info.dir/requires: examples/wave_info/CMakeFiles/wave_info.dir/wave_info.cpp.o.requires
.PHONY : examples/wave_info/CMakeFiles/wave_info.dir/requires

examples/wave_info/CMakeFiles/wave_info.dir/clean:
	cd /home/elchaschab/devel/sndcut-1.0/third/aquila/examples/wave_info && $(CMAKE_COMMAND) -P CMakeFiles/wave_info.dir/cmake_clean.cmake
.PHONY : examples/wave_info/CMakeFiles/wave_info.dir/clean

examples/wave_info/CMakeFiles/wave_info.dir/depend:
	cd /home/elchaschab/devel/sndcut-1.0/third/aquila && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/elchaschab/devel/sndcut-1.0/third/aquila /home/elchaschab/devel/sndcut-1.0/third/aquila/examples/wave_info /home/elchaschab/devel/sndcut-1.0/third/aquila /home/elchaschab/devel/sndcut-1.0/third/aquila/examples/wave_info /home/elchaschab/devel/sndcut-1.0/third/aquila/examples/wave_info/CMakeFiles/wave_info.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : examples/wave_info/CMakeFiles/wave_info.dir/depend

