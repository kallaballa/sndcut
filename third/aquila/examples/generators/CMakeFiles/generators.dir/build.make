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
include examples/generators/CMakeFiles/generators.dir/depend.make

# Include the progress variables for this target.
include examples/generators/CMakeFiles/generators.dir/progress.make

# Include the compile flags for this target's objects.
include examples/generators/CMakeFiles/generators.dir/flags.make

examples/generators/CMakeFiles/generators.dir/generators.cpp.o: examples/generators/CMakeFiles/generators.dir/flags.make
examples/generators/CMakeFiles/generators.dir/generators.cpp.o: examples/generators/generators.cpp
	$(CMAKE_COMMAND) -E cmake_progress_report /home/elchaschab/devel/sndcut-1.0/third/aquila/CMakeFiles $(CMAKE_PROGRESS_1)
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Building CXX object examples/generators/CMakeFiles/generators.dir/generators.cpp.o"
	cd /home/elchaschab/devel/sndcut-1.0/third/aquila/examples/generators && /usr/bin/c++   $(CXX_DEFINES) $(CXX_FLAGS) -o CMakeFiles/generators.dir/generators.cpp.o -c /home/elchaschab/devel/sndcut-1.0/third/aquila/examples/generators/generators.cpp

examples/generators/CMakeFiles/generators.dir/generators.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/generators.dir/generators.cpp.i"
	cd /home/elchaschab/devel/sndcut-1.0/third/aquila/examples/generators && /usr/bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -E /home/elchaschab/devel/sndcut-1.0/third/aquila/examples/generators/generators.cpp > CMakeFiles/generators.dir/generators.cpp.i

examples/generators/CMakeFiles/generators.dir/generators.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/generators.dir/generators.cpp.s"
	cd /home/elchaschab/devel/sndcut-1.0/third/aquila/examples/generators && /usr/bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -S /home/elchaschab/devel/sndcut-1.0/third/aquila/examples/generators/generators.cpp -o CMakeFiles/generators.dir/generators.cpp.s

examples/generators/CMakeFiles/generators.dir/generators.cpp.o.requires:
.PHONY : examples/generators/CMakeFiles/generators.dir/generators.cpp.o.requires

examples/generators/CMakeFiles/generators.dir/generators.cpp.o.provides: examples/generators/CMakeFiles/generators.dir/generators.cpp.o.requires
	$(MAKE) -f examples/generators/CMakeFiles/generators.dir/build.make examples/generators/CMakeFiles/generators.dir/generators.cpp.o.provides.build
.PHONY : examples/generators/CMakeFiles/generators.dir/generators.cpp.o.provides

examples/generators/CMakeFiles/generators.dir/generators.cpp.o.provides.build: examples/generators/CMakeFiles/generators.dir/generators.cpp.o

# Object files for target generators
generators_OBJECTS = \
"CMakeFiles/generators.dir/generators.cpp.o"

# External object files for target generators
generators_EXTERNAL_OBJECTS =

examples/generators/generators: examples/generators/CMakeFiles/generators.dir/generators.cpp.o
examples/generators/generators: examples/generators/CMakeFiles/generators.dir/build.make
examples/generators/generators: libAquila.a
examples/generators/generators: lib/libOoura_fft.a
examples/generators/generators: examples/generators/CMakeFiles/generators.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --red --bold "Linking CXX executable generators"
	cd /home/elchaschab/devel/sndcut-1.0/third/aquila/examples/generators && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/generators.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
examples/generators/CMakeFiles/generators.dir/build: examples/generators/generators
.PHONY : examples/generators/CMakeFiles/generators.dir/build

examples/generators/CMakeFiles/generators.dir/requires: examples/generators/CMakeFiles/generators.dir/generators.cpp.o.requires
.PHONY : examples/generators/CMakeFiles/generators.dir/requires

examples/generators/CMakeFiles/generators.dir/clean:
	cd /home/elchaschab/devel/sndcut-1.0/third/aquila/examples/generators && $(CMAKE_COMMAND) -P CMakeFiles/generators.dir/cmake_clean.cmake
.PHONY : examples/generators/CMakeFiles/generators.dir/clean

examples/generators/CMakeFiles/generators.dir/depend:
	cd /home/elchaschab/devel/sndcut-1.0/third/aquila && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/elchaschab/devel/sndcut-1.0/third/aquila /home/elchaschab/devel/sndcut-1.0/third/aquila/examples/generators /home/elchaschab/devel/sndcut-1.0/third/aquila /home/elchaschab/devel/sndcut-1.0/third/aquila/examples/generators /home/elchaschab/devel/sndcut-1.0/third/aquila/examples/generators/CMakeFiles/generators.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : examples/generators/CMakeFiles/generators.dir/depend

