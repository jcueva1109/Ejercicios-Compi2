# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.16

# Delete rule output on recipe failure.
.DELETE_ON_ERROR:


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
CMAKE_SOURCE_DIR = /home/jcueva1109/Documents/Compi2/Ejemplo4_Bison

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/jcueva1109/Documents/Compi2/Ejemplo4_Bison/build

# Include any dependencies generated for this target.
include CMakeFiles/expr.dir/depend.make

# Include the progress variables for this target.
include CMakeFiles/expr.dir/progress.make

# Include the compile flags for this target's objects.
include CMakeFiles/expr.dir/flags.make

expr_lexer.cpp: ../expr.l
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --blue --bold --progress-dir=/home/jcueva1109/Documents/Compi2/Ejemplo4_Bison/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Generating expr_lexer.cpp"
	flex -o expr_lexer.cpp /home/jcueva1109/Documents/Compi2/Ejemplo4_Bison/expr.l

tokens.h: ../expr.y
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --blue --bold --progress-dir=/home/jcueva1109/Documents/Compi2/Ejemplo4_Bison/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Generating tokens.h, expr_parser.cpp"
	bison --defines=tokens.h -o expr_parser.cpp /home/jcueva1109/Documents/Compi2/Ejemplo4_Bison/expr.y

expr_parser.cpp: tokens.h
	@$(CMAKE_COMMAND) -E touch_nocreate expr_parser.cpp

CMakeFiles/expr.dir/expr_lexer.cpp.o: CMakeFiles/expr.dir/flags.make
CMakeFiles/expr.dir/expr_lexer.cpp.o: expr_lexer.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/jcueva1109/Documents/Compi2/Ejemplo4_Bison/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_3) "Building CXX object CMakeFiles/expr.dir/expr_lexer.cpp.o"
	/usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/expr.dir/expr_lexer.cpp.o -c /home/jcueva1109/Documents/Compi2/Ejemplo4_Bison/build/expr_lexer.cpp

CMakeFiles/expr.dir/expr_lexer.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/expr.dir/expr_lexer.cpp.i"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/jcueva1109/Documents/Compi2/Ejemplo4_Bison/build/expr_lexer.cpp > CMakeFiles/expr.dir/expr_lexer.cpp.i

CMakeFiles/expr.dir/expr_lexer.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/expr.dir/expr_lexer.cpp.s"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/jcueva1109/Documents/Compi2/Ejemplo4_Bison/build/expr_lexer.cpp -o CMakeFiles/expr.dir/expr_lexer.cpp.s

CMakeFiles/expr.dir/expr_parser.cpp.o: CMakeFiles/expr.dir/flags.make
CMakeFiles/expr.dir/expr_parser.cpp.o: expr_parser.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/jcueva1109/Documents/Compi2/Ejemplo4_Bison/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_4) "Building CXX object CMakeFiles/expr.dir/expr_parser.cpp.o"
	/usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/expr.dir/expr_parser.cpp.o -c /home/jcueva1109/Documents/Compi2/Ejemplo4_Bison/build/expr_parser.cpp

CMakeFiles/expr.dir/expr_parser.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/expr.dir/expr_parser.cpp.i"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/jcueva1109/Documents/Compi2/Ejemplo4_Bison/build/expr_parser.cpp > CMakeFiles/expr.dir/expr_parser.cpp.i

CMakeFiles/expr.dir/expr_parser.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/expr.dir/expr_parser.cpp.s"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/jcueva1109/Documents/Compi2/Ejemplo4_Bison/build/expr_parser.cpp -o CMakeFiles/expr.dir/expr_parser.cpp.s

CMakeFiles/expr.dir/main.cpp.o: CMakeFiles/expr.dir/flags.make
CMakeFiles/expr.dir/main.cpp.o: ../main.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/jcueva1109/Documents/Compi2/Ejemplo4_Bison/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_5) "Building CXX object CMakeFiles/expr.dir/main.cpp.o"
	/usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/expr.dir/main.cpp.o -c /home/jcueva1109/Documents/Compi2/Ejemplo4_Bison/main.cpp

CMakeFiles/expr.dir/main.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/expr.dir/main.cpp.i"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/jcueva1109/Documents/Compi2/Ejemplo4_Bison/main.cpp > CMakeFiles/expr.dir/main.cpp.i

CMakeFiles/expr.dir/main.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/expr.dir/main.cpp.s"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/jcueva1109/Documents/Compi2/Ejemplo4_Bison/main.cpp -o CMakeFiles/expr.dir/main.cpp.s

# Object files for target expr
expr_OBJECTS = \
"CMakeFiles/expr.dir/expr_lexer.cpp.o" \
"CMakeFiles/expr.dir/expr_parser.cpp.o" \
"CMakeFiles/expr.dir/main.cpp.o"

# External object files for target expr
expr_EXTERNAL_OBJECTS =

expr: CMakeFiles/expr.dir/expr_lexer.cpp.o
expr: CMakeFiles/expr.dir/expr_parser.cpp.o
expr: CMakeFiles/expr.dir/main.cpp.o
expr: CMakeFiles/expr.dir/build.make
expr: CMakeFiles/expr.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/jcueva1109/Documents/Compi2/Ejemplo4_Bison/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_6) "Linking CXX executable expr"
	$(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/expr.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
CMakeFiles/expr.dir/build: expr

.PHONY : CMakeFiles/expr.dir/build

CMakeFiles/expr.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles/expr.dir/cmake_clean.cmake
.PHONY : CMakeFiles/expr.dir/clean

CMakeFiles/expr.dir/depend: expr_lexer.cpp
CMakeFiles/expr.dir/depend: tokens.h
CMakeFiles/expr.dir/depend: expr_parser.cpp
	cd /home/jcueva1109/Documents/Compi2/Ejemplo4_Bison/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/jcueva1109/Documents/Compi2/Ejemplo4_Bison /home/jcueva1109/Documents/Compi2/Ejemplo4_Bison /home/jcueva1109/Documents/Compi2/Ejemplo4_Bison/build /home/jcueva1109/Documents/Compi2/Ejemplo4_Bison/build /home/jcueva1109/Documents/Compi2/Ejemplo4_Bison/build/CMakeFiles/expr.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : CMakeFiles/expr.dir/depend

