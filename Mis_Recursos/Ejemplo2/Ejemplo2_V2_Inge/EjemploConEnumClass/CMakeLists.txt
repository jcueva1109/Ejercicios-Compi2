cmake_minimum_required(VERSION 3.10)
project (sample1)

set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

#Run FLEX to generate the lexer
add_custom_command(

    OUTPUT lexer.cpp
    COMMAND flex -o lexer.cpp ${PROJECT_SOURCE_DIR}/sample1.l
    MAIN_DEPENDENCY ${PROJECT_SOURCE_DIR}/sample1.l

)

INCLUDE_DIRECTORIES(${CMAKE_BINARY_DIR})
include_directories(${PROJECT_SOURCE_DIR})

add_executable(${PROJECT_NAME} main.cpp lexer.cpp)