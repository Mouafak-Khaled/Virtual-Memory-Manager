# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.19

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
CMAKE_COMMAND = /snap/clion/152/bin/cmake/linux/bin/cmake

# The command to remove a file.
RM = /snap/clion/152/bin/cmake/linux/bin/cmake -E rm -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /home/sarieh/Documents/gitkraken/Virtual-Memory-Manager

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/sarieh/Documents/gitkraken/Virtual-Memory-Manager/cmake-build-debug

# Include any dependencies generated for this target.
include CMakeFiles/Virtual_Memory_Manager.dir/depend.make

# Include the progress variables for this target.
include CMakeFiles/Virtual_Memory_Manager.dir/progress.make

# Include the compile flags for this target's objects.
include CMakeFiles/Virtual_Memory_Manager.dir/flags.make

CMakeFiles/Virtual_Memory_Manager.dir/part1.c.o: CMakeFiles/Virtual_Memory_Manager.dir/flags.make
CMakeFiles/Virtual_Memory_Manager.dir/part1.c.o: ../part1.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/sarieh/Documents/gitkraken/Virtual-Memory-Manager/cmake-build-debug/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building C object CMakeFiles/Virtual_Memory_Manager.dir/part1.c.o"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles/Virtual_Memory_Manager.dir/part1.c.o -c /home/sarieh/Documents/gitkraken/Virtual-Memory-Manager/part1.c

CMakeFiles/Virtual_Memory_Manager.dir/part1.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/Virtual_Memory_Manager.dir/part1.c.i"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/sarieh/Documents/gitkraken/Virtual-Memory-Manager/part1.c > CMakeFiles/Virtual_Memory_Manager.dir/part1.c.i

CMakeFiles/Virtual_Memory_Manager.dir/part1.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/Virtual_Memory_Manager.dir/part1.c.s"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/sarieh/Documents/gitkraken/Virtual-Memory-Manager/part1.c -o CMakeFiles/Virtual_Memory_Manager.dir/part1.c.s

CMakeFiles/Virtual_Memory_Manager.dir/part2.c.o: CMakeFiles/Virtual_Memory_Manager.dir/flags.make
CMakeFiles/Virtual_Memory_Manager.dir/part2.c.o: ../part2.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/sarieh/Documents/gitkraken/Virtual-Memory-Manager/cmake-build-debug/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Building C object CMakeFiles/Virtual_Memory_Manager.dir/part2.c.o"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles/Virtual_Memory_Manager.dir/part2.c.o -c /home/sarieh/Documents/gitkraken/Virtual-Memory-Manager/part2.c

CMakeFiles/Virtual_Memory_Manager.dir/part2.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/Virtual_Memory_Manager.dir/part2.c.i"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/sarieh/Documents/gitkraken/Virtual-Memory-Manager/part2.c > CMakeFiles/Virtual_Memory_Manager.dir/part2.c.i

CMakeFiles/Virtual_Memory_Manager.dir/part2.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/Virtual_Memory_Manager.dir/part2.c.s"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/sarieh/Documents/gitkraken/Virtual-Memory-Manager/part2.c -o CMakeFiles/Virtual_Memory_Manager.dir/part2.c.s

# Object files for target Virtual_Memory_Manager
Virtual_Memory_Manager_OBJECTS = \
"CMakeFiles/Virtual_Memory_Manager.dir/part1.c.o" \
"CMakeFiles/Virtual_Memory_Manager.dir/part2.c.o"

# External object files for target Virtual_Memory_Manager
Virtual_Memory_Manager_EXTERNAL_OBJECTS =

Virtual_Memory_Manager: CMakeFiles/Virtual_Memory_Manager.dir/part1.c.o
Virtual_Memory_Manager: CMakeFiles/Virtual_Memory_Manager.dir/part2.c.o
Virtual_Memory_Manager: CMakeFiles/Virtual_Memory_Manager.dir/build.make
Virtual_Memory_Manager: CMakeFiles/Virtual_Memory_Manager.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/sarieh/Documents/gitkraken/Virtual-Memory-Manager/cmake-build-debug/CMakeFiles --progress-num=$(CMAKE_PROGRESS_3) "Linking C executable Virtual_Memory_Manager"
	$(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/Virtual_Memory_Manager.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
CMakeFiles/Virtual_Memory_Manager.dir/build: Virtual_Memory_Manager

.PHONY : CMakeFiles/Virtual_Memory_Manager.dir/build

CMakeFiles/Virtual_Memory_Manager.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles/Virtual_Memory_Manager.dir/cmake_clean.cmake
.PHONY : CMakeFiles/Virtual_Memory_Manager.dir/clean

CMakeFiles/Virtual_Memory_Manager.dir/depend:
	cd /home/sarieh/Documents/gitkraken/Virtual-Memory-Manager/cmake-build-debug && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/sarieh/Documents/gitkraken/Virtual-Memory-Manager /home/sarieh/Documents/gitkraken/Virtual-Memory-Manager /home/sarieh/Documents/gitkraken/Virtual-Memory-Manager/cmake-build-debug /home/sarieh/Documents/gitkraken/Virtual-Memory-Manager/cmake-build-debug /home/sarieh/Documents/gitkraken/Virtual-Memory-Manager/cmake-build-debug/CMakeFiles/Virtual_Memory_Manager.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : CMakeFiles/Virtual_Memory_Manager.dir/depend

