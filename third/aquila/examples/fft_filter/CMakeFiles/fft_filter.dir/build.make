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
CMAKE_SOURCE_DIR = /home/elchaschab/devel/sndcut/third/aquila

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/elchaschab/devel/sndcut/third/aquila

# Include any dependencies generated for this target.
include examples/fft_filter/CMakeFiles/fft_filter.dir/depend.make

# Include the progress variables for this target.
include examples/fft_filter/CMakeFiles/fft_filter.dir/progress.make

# Include the compile flags for this target's objects.
include examples/fft_filter/CMakeFiles/fft_filter.dir/flags.make

examples/fft_filter/CMakeFiles/fft_filter.dir/fft_filter.cpp.o: examples/fft_filter/CMakeFiles/fft_filter.dir/flags.make
examples/fft_filter/CMakeFiles/fft_filter.dir/fft_filter.cpp.o: examples/fft_filter/fft_filter.cpp
	$(CMAKE_COMMAND) -E cmake_progress_report /home/elchaschab/devel/sndcut/third/aquila/CMakeFiles $(CMAKE_PROGRESS_1)
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Building CXX object examples/fft_filter/CMakeFiles/fft_filter.dir/fft_filter.cpp.o"
	cd /home/elchaschab/devel/sndcut/third/aquila/examples/fft_filter && /usr/bin/c++   $(CXX_DEFINES) $(CXX_FLAGS) -o CMakeFiles/fft_filter.dir/fft_filter.cpp.o -c /home/elchaschab/devel/sndcut/third/aquila/examples/fft_filter/fft_filter.cpp

examples/fft_filter/CMakeFiles/fft_filter.dir/fft_filter.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/fft_filter.dir/fft_filter.cpp.i"
	cd /home/elchaschab/devel/sndcut/third/aquila/examples/fft_filter && /usr/bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -E /home/elchaschab/devel/sndcut/third/aquila/examples/fft_filter/fft_filter.cpp > CMakeFiles/fft_filter.dir/fft_filter.cpp.i

examples/fft_filter/CMakeFiles/fft_filter.dir/fft_filter.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/fft_filter.dir/fft_filter.cpp.s"
	cd /home/elchaschab/devel/sndcut/third/aquila/examples/fft_filter && /usr/bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -S /home/elchaschab/devel/sndcut/third/aquila/examples/fft_filter/fft_filter.cpp -o CMakeFiles/fft_filter.dir/fft_filter.cpp.s

examples/fft_filter/CMakeFiles/fft_filter.dir/fft_filter.cpp.o.requires:
.PHONY : examples/fft_filter/CMakeFiles/fft_filter.dir/fft_filter.cpp.o.requires

examples/fft_filter/CMakeFiles/fft_filter.dir/fft_filter.cpp.o.provides: examples/fft_filter/CMakeFiles/fft_filter.dir/fft_filter.cpp.o.requires
	$(MAKE) -f examples/fft_filter/CMakeFiles/fft_filter.dir/build.make examples/fft_filter/CMakeFiles/fft_filter.dir/fft_filter.cpp.o.provides.build
.PHONY : examples/fft_filter/CMakeFiles/fft_filter.dir/fft_filter.cpp.o.provides

examples/fft_filter/CMakeFiles/fft_filter.dir/fft_filter.cpp.o.provides.build: examples/fft_filter/CMakeFiles/fft_filter.dir/fft_filter.cpp.o

# Object files for target fft_filter
fft_filter_OBJECTS = \
"CMakeFiles/fft_filter.dir/fft_filter.cpp.o"

# External object files for target fft_filter
fft_filter_EXTERNAL_OBJECTS =

examples/fft_filter/fft_filter: examples/fft_filter/CMakeFiles/fft_filter.dir/fft_filter.cpp.o
examples/fft_filter/fft_filter: examples/fft_filter/CMakeFiles/fft_filter.dir/build.make
examples/fft_filter/fft_filter: libAquila.a
examples/fft_filter/fft_filter: lib/libOoura_fft.a
examples/fft_filter/fft_filter: examples/fft_filter/CMakeFiles/fft_filter.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --red --bold "Linking CXX executable fft_filter"
	cd /home/elchaschab/devel/sndcut/third/aquila/examples/fft_filter && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/fft_filter.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
examples/fft_filter/CMakeFiles/fft_filter.dir/build: examples/fft_filter/fft_filter
.PHONY : examples/fft_filter/CMakeFiles/fft_filter.dir/build

examples/fft_filter/CMakeFiles/fft_filter.dir/requires: examples/fft_filter/CMakeFiles/fft_filter.dir/fft_filter.cpp.o.requires
.PHONY : examples/fft_filter/CMakeFiles/fft_filter.dir/requires

examples/fft_filter/CMakeFiles/fft_filter.dir/clean:
	cd /home/elchaschab/devel/sndcut/third/aquila/examples/fft_filter && $(CMAKE_COMMAND) -P CMakeFiles/fft_filter.dir/cmake_clean.cmake
.PHONY : examples/fft_filter/CMakeFiles/fft_filter.dir/clean

examples/fft_filter/CMakeFiles/fft_filter.dir/depend:
	cd /home/elchaschab/devel/sndcut/third/aquila && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/elchaschab/devel/sndcut/third/aquila /home/elchaschab/devel/sndcut/third/aquila/examples/fft_filter /home/elchaschab/devel/sndcut/third/aquila /home/elchaschab/devel/sndcut/third/aquila/examples/fft_filter /home/elchaschab/devel/sndcut/third/aquila/examples/fft_filter/CMakeFiles/fft_filter.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : examples/fft_filter/CMakeFiles/fft_filter.dir/depend

