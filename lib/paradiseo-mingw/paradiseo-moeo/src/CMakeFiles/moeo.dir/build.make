# CMAKE generated file: DO NOT EDIT!
# Generated by "MSYS Makefiles" Generator, CMake Version 2.8

#=============================================================================
# Special targets provided by cmake.

# Disable implicit rules so canoncical targets will work.
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
CMAKE_COMMAND = "/c/Program Files (x86)/CMake 2.8/bin/cmake.exe"

# The command to remove a file.
RM = "/c/Program Files (x86)/CMake 2.8/bin/cmake.exe" -E remove -f

# The program to use to edit the cache.
CMAKE_EDIT_COMMAND = "/c/Program Files (x86)/CMake 2.8/bin/cmake-gui.exe"

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /C/ParadisEO-1.2/paradiseo-moeo

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /C/ParadisEO-1.2/paradiseo-moeo

# Include any dependencies generated for this target.
include src/CMakeFiles/moeo.dir/depend.make

# Include the progress variables for this target.
include src/CMakeFiles/moeo.dir/progress.make

# Include the compile flags for this target's objects.
include src/CMakeFiles/moeo.dir/flags.make

src/CMakeFiles/moeo.dir/core/moeoObjectiveVectorTraits.cpp.obj: src/CMakeFiles/moeo.dir/flags.make
src/CMakeFiles/moeo.dir/core/moeoObjectiveVectorTraits.cpp.obj: src/core/moeoObjectiveVectorTraits.cpp
	$(CMAKE_COMMAND) -E cmake_progress_report /C/ParadisEO-1.2/paradiseo-moeo/CMakeFiles $(CMAKE_PROGRESS_1)
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Building CXX object src/CMakeFiles/moeo.dir/core/moeoObjectiveVectorTraits.cpp.obj"
	cd /C/ParadisEO-1.2/paradiseo-moeo/src && /C/Qt/2010.05/mingw/bin/g++.exe   $(CXX_DEFINES) $(CXX_FLAGS) -o CMakeFiles/moeo.dir/core/moeoObjectiveVectorTraits.cpp.obj -c /C/ParadisEO-1.2/paradiseo-moeo/src/core/moeoObjectiveVectorTraits.cpp

src/CMakeFiles/moeo.dir/core/moeoObjectiveVectorTraits.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/moeo.dir/core/moeoObjectiveVectorTraits.cpp.i"
	cd /C/ParadisEO-1.2/paradiseo-moeo/src && /C/Qt/2010.05/mingw/bin/g++.exe  $(CXX_DEFINES) $(CXX_FLAGS) -E /C/ParadisEO-1.2/paradiseo-moeo/src/core/moeoObjectiveVectorTraits.cpp > CMakeFiles/moeo.dir/core/moeoObjectiveVectorTraits.cpp.i

src/CMakeFiles/moeo.dir/core/moeoObjectiveVectorTraits.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/moeo.dir/core/moeoObjectiveVectorTraits.cpp.s"
	cd /C/ParadisEO-1.2/paradiseo-moeo/src && /C/Qt/2010.05/mingw/bin/g++.exe  $(CXX_DEFINES) $(CXX_FLAGS) -S /C/ParadisEO-1.2/paradiseo-moeo/src/core/moeoObjectiveVectorTraits.cpp -o CMakeFiles/moeo.dir/core/moeoObjectiveVectorTraits.cpp.s

src/CMakeFiles/moeo.dir/core/moeoObjectiveVectorTraits.cpp.obj.requires:
.PHONY : src/CMakeFiles/moeo.dir/core/moeoObjectiveVectorTraits.cpp.obj.requires

src/CMakeFiles/moeo.dir/core/moeoObjectiveVectorTraits.cpp.obj.provides: src/CMakeFiles/moeo.dir/core/moeoObjectiveVectorTraits.cpp.obj.requires
	$(MAKE) -f src/CMakeFiles/moeo.dir/build.make src/CMakeFiles/moeo.dir/core/moeoObjectiveVectorTraits.cpp.obj.provides.build
.PHONY : src/CMakeFiles/moeo.dir/core/moeoObjectiveVectorTraits.cpp.obj.provides

src/CMakeFiles/moeo.dir/core/moeoObjectiveVectorTraits.cpp.obj.provides.build: src/CMakeFiles/moeo.dir/core/moeoObjectiveVectorTraits.cpp.obj

# Object files for target moeo
moeo_OBJECTS = \
"CMakeFiles/moeo.dir/core/moeoObjectiveVectorTraits.cpp.obj"

# External object files for target moeo
moeo_EXTERNAL_OBJECTS =

lib/libmoeo.a: src/CMakeFiles/moeo.dir/core/moeoObjectiveVectorTraits.cpp.obj
lib/libmoeo.a: src/CMakeFiles/moeo.dir/build.make
lib/libmoeo.a: src/CMakeFiles/moeo.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --red --bold "Linking CXX static library ../lib/libmoeo.a"
	cd /C/ParadisEO-1.2/paradiseo-moeo/src && $(CMAKE_COMMAND) -P CMakeFiles/moeo.dir/cmake_clean_target.cmake
	cd /C/ParadisEO-1.2/paradiseo-moeo/src && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/moeo.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
src/CMakeFiles/moeo.dir/build: lib/libmoeo.a
.PHONY : src/CMakeFiles/moeo.dir/build

src/CMakeFiles/moeo.dir/requires: src/CMakeFiles/moeo.dir/core/moeoObjectiveVectorTraits.cpp.obj.requires
.PHONY : src/CMakeFiles/moeo.dir/requires

src/CMakeFiles/moeo.dir/clean:
	cd /C/ParadisEO-1.2/paradiseo-moeo/src && $(CMAKE_COMMAND) -P CMakeFiles/moeo.dir/cmake_clean.cmake
.PHONY : src/CMakeFiles/moeo.dir/clean

src/CMakeFiles/moeo.dir/depend:
	$(CMAKE_COMMAND) -E cmake_depends "MSYS Makefiles" /C/ParadisEO-1.2/paradiseo-moeo /C/ParadisEO-1.2/paradiseo-moeo/src /C/ParadisEO-1.2/paradiseo-moeo /C/ParadisEO-1.2/paradiseo-moeo/src /C/ParadisEO-1.2/paradiseo-moeo/src/CMakeFiles/moeo.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : src/CMakeFiles/moeo.dir/depend

