# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.2

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
CMAKE_SOURCE_DIR = /home/raymond/Dropbox/TMA4280/Exercises/ex4

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/raymond/Dropbox/TMA4280/Exercises/ex4/rebuild

# Include any dependencies generated for this target.
include CMakeFiles/ex4.dir/depend.make

# Include the progress variables for this target.
include CMakeFiles/ex4.dir/progress.make

# Include the compile flags for this target's objects.
include CMakeFiles/ex4.dir/flags.make

CMakeFiles/ex4.dir/main.c.o: CMakeFiles/ex4.dir/flags.make
CMakeFiles/ex4.dir/main.c.o: ../main.c
	$(CMAKE_COMMAND) -E cmake_progress_report /home/raymond/Dropbox/TMA4280/Exercises/ex4/rebuild/CMakeFiles $(CMAKE_PROGRESS_1)
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Building C object CMakeFiles/ex4.dir/main.c.o"
	/usr/bin/cc  $(C_DEFINES) $(C_FLAGS) -o CMakeFiles/ex4.dir/main.c.o   -c /home/raymond/Dropbox/TMA4280/Exercises/ex4/main.c

CMakeFiles/ex4.dir/main.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/ex4.dir/main.c.i"
	/usr/bin/cc  $(C_DEFINES) $(C_FLAGS) -E /home/raymond/Dropbox/TMA4280/Exercises/ex4/main.c > CMakeFiles/ex4.dir/main.c.i

CMakeFiles/ex4.dir/main.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/ex4.dir/main.c.s"
	/usr/bin/cc  $(C_DEFINES) $(C_FLAGS) -S /home/raymond/Dropbox/TMA4280/Exercises/ex4/main.c -o CMakeFiles/ex4.dir/main.c.s

CMakeFiles/ex4.dir/main.c.o.requires:
.PHONY : CMakeFiles/ex4.dir/main.c.o.requires

CMakeFiles/ex4.dir/main.c.o.provides: CMakeFiles/ex4.dir/main.c.o.requires
	$(MAKE) -f CMakeFiles/ex4.dir/build.make CMakeFiles/ex4.dir/main.c.o.provides.build
.PHONY : CMakeFiles/ex4.dir/main.c.o.provides

CMakeFiles/ex4.dir/main.c.o.provides.build: CMakeFiles/ex4.dir/main.c.o

CMakeFiles/ex4.dir/functions.c.o: CMakeFiles/ex4.dir/flags.make
CMakeFiles/ex4.dir/functions.c.o: ../functions.c
	$(CMAKE_COMMAND) -E cmake_progress_report /home/raymond/Dropbox/TMA4280/Exercises/ex4/rebuild/CMakeFiles $(CMAKE_PROGRESS_2)
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Building C object CMakeFiles/ex4.dir/functions.c.o"
	/usr/bin/cc  $(C_DEFINES) $(C_FLAGS) -o CMakeFiles/ex4.dir/functions.c.o   -c /home/raymond/Dropbox/TMA4280/Exercises/ex4/functions.c

CMakeFiles/ex4.dir/functions.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/ex4.dir/functions.c.i"
	/usr/bin/cc  $(C_DEFINES) $(C_FLAGS) -E /home/raymond/Dropbox/TMA4280/Exercises/ex4/functions.c > CMakeFiles/ex4.dir/functions.c.i

CMakeFiles/ex4.dir/functions.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/ex4.dir/functions.c.s"
	/usr/bin/cc  $(C_DEFINES) $(C_FLAGS) -S /home/raymond/Dropbox/TMA4280/Exercises/ex4/functions.c -o CMakeFiles/ex4.dir/functions.c.s

CMakeFiles/ex4.dir/functions.c.o.requires:
.PHONY : CMakeFiles/ex4.dir/functions.c.o.requires

CMakeFiles/ex4.dir/functions.c.o.provides: CMakeFiles/ex4.dir/functions.c.o.requires
	$(MAKE) -f CMakeFiles/ex4.dir/build.make CMakeFiles/ex4.dir/functions.c.o.provides.build
.PHONY : CMakeFiles/ex4.dir/functions.c.o.provides

CMakeFiles/ex4.dir/functions.c.o.provides.build: CMakeFiles/ex4.dir/functions.c.o

# Object files for target ex4
ex4_OBJECTS = \
"CMakeFiles/ex4.dir/main.c.o" \
"CMakeFiles/ex4.dir/functions.c.o"

# External object files for target ex4
ex4_EXTERNAL_OBJECTS =

ex4: CMakeFiles/ex4.dir/main.c.o
ex4: CMakeFiles/ex4.dir/functions.c.o
ex4: CMakeFiles/ex4.dir/build.make
ex4: /usr/local/lib/libmpi.so
ex4: CMakeFiles/ex4.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --red --bold "Linking C executable ex4"
	$(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/ex4.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
CMakeFiles/ex4.dir/build: ex4
.PHONY : CMakeFiles/ex4.dir/build

CMakeFiles/ex4.dir/requires: CMakeFiles/ex4.dir/main.c.o.requires
CMakeFiles/ex4.dir/requires: CMakeFiles/ex4.dir/functions.c.o.requires
.PHONY : CMakeFiles/ex4.dir/requires

CMakeFiles/ex4.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles/ex4.dir/cmake_clean.cmake
.PHONY : CMakeFiles/ex4.dir/clean

CMakeFiles/ex4.dir/depend:
	cd /home/raymond/Dropbox/TMA4280/Exercises/ex4/rebuild && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/raymond/Dropbox/TMA4280/Exercises/ex4 /home/raymond/Dropbox/TMA4280/Exercises/ex4 /home/raymond/Dropbox/TMA4280/Exercises/ex4/rebuild /home/raymond/Dropbox/TMA4280/Exercises/ex4/rebuild /home/raymond/Dropbox/TMA4280/Exercises/ex4/rebuild/CMakeFiles/ex4.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : CMakeFiles/ex4.dir/depend

