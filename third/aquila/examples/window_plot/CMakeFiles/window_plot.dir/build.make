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
include examples/window_plot/CMakeFiles/window_plot.dir/depend.make

# Include the progress variables for this target.
include examples/window_plot/CMakeFiles/window_plot.dir/progress.make

# Include the compile flags for this target's objects.
include examples/window_plot/CMakeFiles/window_plot.dir/flags.make

examples/window_plot/CMakeFiles/window_plot.dir/window_plot.cpp.o: examples/window_plot/CMakeFiles/window_plot.dir/flags.make
examples/window_plot/CMakeFiles/window_plot.dir/window_plot.cpp.o: examples/window_plot/window_plot.cpp
	$(CMAKE_COMMAND) -E cmake_progress_report /home/elchaschab/devel/sndcut/third/aquila/CMakeFiles $(CMAKE_PROGRESS_1)
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Building CXX object examples/window_plot/CMakeFiles/window_plot.dir/window_plot.cpp.o"
	cd /home/elchaschab/devel/sndcut/third/aquila/examples/window_plot && /usr/bin/c++   $(CXX_DEFINES) $(CXX_FLAGS) -o CMakeFiles/window_plot.dir/window_plot.cpp.o -c /home/elchaschab/devel/sndcut/third/aquila/examples/window_plot/window_plot.cpp

examples/window_plot/CMakeFiles/window_plot.dir/window_plot.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/window_plot.dir/window_plot.cpp.i"
	cd /home/elchaschab/devel/sndcut/third/aquila/examples/window_plot && /usr/bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -E /home/elchaschab/devel/sndcut/third/aquila/examples/window_plot/window_plot.cpp > CMakeFiles/window_plot.dir/window_plot.cpp.i

examples/window_plot/CMakeFiles/window_plot.dir/window_plot.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/window_plot.dir/window_plot.cpp.s"
	cd /home/elchaschab/devel/sndcut/third/aquila/examples/window_plot && /usr/bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -S /home/elchaschab/devel/sndcut/third/aquila/examples/window_plot/window_plot.cpp -o CMakeFiles/window_plot.dir/window_plot.cpp.s

examples/window_plot/CMakeFiles/window_plot.dir/window_plot.cpp.o.requires:
.PHONY : examples/window_plot/CMakeFiles/window_plot.dir/window_plot.cpp.o.requires

examples/window_plot/CMakeFiles/window_plot.dir/window_plot.cpp.o.provides: examples/window_plot/CMakeFiles/window_plot.dir/window_plot.cpp.o.requires
	$(MAKE) -f examples/window_plot/CMakeFiles/window_plot.dir/build.make examples/window_plot/CMakeFiles/window_plot.dir/window_plot.cpp.o.provides.build
.PHONY : examples/window_plot/CMakeFiles/window_plot.dir/window_plot.cpp.o.provides

examples/window_plot/CMakeFiles/window_plot.dir/window_plot.cpp.o.provides.build: examples/window_plot/CMakeFiles/window_plot.dir/window_plot.cpp.o

# Object files for target window_plot
window_plot_OBJECTS = \
"CMakeFiles/window_plot.dir/window_plot.cpp.o"

# External object files for target window_plot
window_plot_EXTERNAL_OBJECTS =

examples/window_plot/window_plot: examples/window_plot/CMakeFiles/window_plot.dir/window_plot.cpp.o
examples/window_plot/window_plot: examples/window_plot/CMakeFiles/window_plot.dir/build.make
examples/window_plot/window_plot: libAquila.a
examples/window_plot/window_plot: lib/libOoura_fft.a
examples/window_plot/window_plot: examples/window_plot/CMakeFiles/window_plot.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --red --bold "Linking CXX executable window_plot"
	cd /home/elchaschab/devel/sndcut/third/aquila/examples/window_plot && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/window_plot.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
examples/window_plot/CMakeFiles/window_plot.dir/build: examples/window_plot/window_plot
.PHONY : examples/window_plot/CMakeFiles/window_plot.dir/build

examples/window_plot/CMakeFiles/window_plot.dir/requires: examples/window_plot/CMakeFiles/window_plot.dir/window_plot.cpp.o.requires
.PHONY : examples/window_plot/CMakeFiles/window_plot.dir/requires

examples/window_plot/CMakeFiles/window_plot.dir/clean:
	cd /home/elchaschab/devel/sndcut/third/aquila/examples/window_plot && $(CMAKE_COMMAND) -P CMakeFiles/window_plot.dir/cmake_clean.cmake
.PHONY : examples/window_plot/CMakeFiles/window_plot.dir/clean

examples/window_plot/CMakeFiles/window_plot.dir/depend:
	cd /home/elchaschab/devel/sndcut/third/aquila && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/elchaschab/devel/sndcut/third/aquila /home/elchaschab/devel/sndcut/third/aquila/examples/window_plot /home/elchaschab/devel/sndcut/third/aquila /home/elchaschab/devel/sndcut/third/aquila/examples/window_plot /home/elchaschab/devel/sndcut/third/aquila/examples/window_plot/CMakeFiles/window_plot.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : examples/window_plot/CMakeFiles/window_plot.dir/depend
