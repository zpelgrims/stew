# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.22

# Delete rule output on recipe failure.
.DELETE_ON_ERROR:

#=============================================================================
# Special targets provided by cmake.

# Disable implicit rules so canonical targets will work.
.SUFFIXES:

# Disable VCS-based implicit rules.
% : %,v

# Disable VCS-based implicit rules.
% : RCS/%

# Disable VCS-based implicit rules.
% : RCS/%,v

# Disable VCS-based implicit rules.
% : SCCS/s.%

# Disable VCS-based implicit rules.
% : s.%

.SUFFIXES: .hpux_make_needs_suffix_list

# Command-line flag to silence nested $(MAKE).
$(VERBOSE)MAKESILENT = -s

#Suppress display of executed commands.
$(VERBOSE).SILENT:

# A target that is always out of date.
cmake_force:
.PHONY : cmake_force

#=============================================================================
# Set environment variables for the build.

# The shell in which to execute make rules.
SHELL = /bin/sh

# The CMake executable.
CMAKE_COMMAND = /usr/local/Cellar/cmake/3.22.1/bin/cmake

# The command to remove a file.
RM = /usr/local/Cellar/cmake/3.22.1/bin/cmake -E rm -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /Users/zenopelgrims/stew

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /Users/zenopelgrims/stew/build

# Include any dependencies generated for this target.
include src/CMakeFiles/stew.dir/depend.make
# Include any dependencies generated by the compiler for this target.
include src/CMakeFiles/stew.dir/compiler_depend.make

# Include the progress variables for this target.
include src/CMakeFiles/stew.dir/progress.make

# Include the compile flags for this target's objects.
include src/CMakeFiles/stew.dir/flags.make

src/CMakeFiles/stew.dir/stew_loader.cpp.o: src/CMakeFiles/stew.dir/flags.make
src/CMakeFiles/stew.dir/stew_loader.cpp.o: ../src/stew_loader.cpp
src/CMakeFiles/stew.dir/stew_loader.cpp.o: src/CMakeFiles/stew.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/Users/zenopelgrims/stew/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object src/CMakeFiles/stew.dir/stew_loader.cpp.o"
	cd /Users/zenopelgrims/stew/build/src && /Library/Developer/CommandLineTools/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT src/CMakeFiles/stew.dir/stew_loader.cpp.o -MF CMakeFiles/stew.dir/stew_loader.cpp.o.d -o CMakeFiles/stew.dir/stew_loader.cpp.o -c /Users/zenopelgrims/stew/src/stew_loader.cpp

src/CMakeFiles/stew.dir/stew_loader.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/stew.dir/stew_loader.cpp.i"
	cd /Users/zenopelgrims/stew/build/src && /Library/Developer/CommandLineTools/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /Users/zenopelgrims/stew/src/stew_loader.cpp > CMakeFiles/stew.dir/stew_loader.cpp.i

src/CMakeFiles/stew.dir/stew_loader.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/stew.dir/stew_loader.cpp.s"
	cd /Users/zenopelgrims/stew/build/src && /Library/Developer/CommandLineTools/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /Users/zenopelgrims/stew/src/stew_loader.cpp -o CMakeFiles/stew.dir/stew_loader.cpp.s

src/CMakeFiles/stew.dir/stew_imager.cpp.o: src/CMakeFiles/stew.dir/flags.make
src/CMakeFiles/stew.dir/stew_imager.cpp.o: ../src/stew_imager.cpp
src/CMakeFiles/stew.dir/stew_imager.cpp.o: src/CMakeFiles/stew.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/Users/zenopelgrims/stew/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Building CXX object src/CMakeFiles/stew.dir/stew_imager.cpp.o"
	cd /Users/zenopelgrims/stew/build/src && /Library/Developer/CommandLineTools/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT src/CMakeFiles/stew.dir/stew_imager.cpp.o -MF CMakeFiles/stew.dir/stew_imager.cpp.o.d -o CMakeFiles/stew.dir/stew_imager.cpp.o -c /Users/zenopelgrims/stew/src/stew_imager.cpp

src/CMakeFiles/stew.dir/stew_imager.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/stew.dir/stew_imager.cpp.i"
	cd /Users/zenopelgrims/stew/build/src && /Library/Developer/CommandLineTools/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /Users/zenopelgrims/stew/src/stew_imager.cpp > CMakeFiles/stew.dir/stew_imager.cpp.i

src/CMakeFiles/stew.dir/stew_imager.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/stew.dir/stew_imager.cpp.s"
	cd /Users/zenopelgrims/stew/build/src && /Library/Developer/CommandLineTools/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /Users/zenopelgrims/stew/src/stew_imager.cpp -o CMakeFiles/stew.dir/stew_imager.cpp.s

# Object files for target stew
stew_OBJECTS = \
"CMakeFiles/stew.dir/stew_loader.cpp.o" \
"CMakeFiles/stew.dir/stew_imager.cpp.o"

# External object files for target stew
stew_EXTERNAL_OBJECTS =

src/stew.dylib: src/CMakeFiles/stew.dir/stew_loader.cpp.o
src/stew.dylib: src/CMakeFiles/stew.dir/stew_imager.cpp.o
src/stew.dylib: src/CMakeFiles/stew.dir/build.make
src/stew.dylib: src/CMakeFiles/stew.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/Users/zenopelgrims/stew/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_3) "Linking CXX shared library stew.dylib"
	cd /Users/zenopelgrims/stew/build/src && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/stew.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
src/CMakeFiles/stew.dir/build: src/stew.dylib
.PHONY : src/CMakeFiles/stew.dir/build

src/CMakeFiles/stew.dir/clean:
	cd /Users/zenopelgrims/stew/build/src && $(CMAKE_COMMAND) -P CMakeFiles/stew.dir/cmake_clean.cmake
.PHONY : src/CMakeFiles/stew.dir/clean

src/CMakeFiles/stew.dir/depend:
	cd /Users/zenopelgrims/stew/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /Users/zenopelgrims/stew /Users/zenopelgrims/stew/src /Users/zenopelgrims/stew/build /Users/zenopelgrims/stew/build/src /Users/zenopelgrims/stew/build/src/CMakeFiles/stew.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : src/CMakeFiles/stew.dir/depend
