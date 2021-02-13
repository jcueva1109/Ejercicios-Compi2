cmake_minimum_required (VERSION 3.0)
project (expr)
 
set(CMAKE_CXX_STANDARD 14)
set(CMAKE_CXX_STANDARD_REQUIRED ON)
 
set (LEXER_SRC "${PROJECT_SOURCE_DIR}/expr.l")
set (PARSER_SRC "${PROJECT_SOURCE_DIR}/expr.y")
set (TREE_SRC "${PROJECT_SOURCE_DIR}/expr.tc")
 
# Run treecc to generate the ast tree
add_custom_command (
  OUTPUT treecc.h treecc.cpp
  COMMAND treecc -o treecc.cpp -h treecc.h ${TREE_SRC}
  MAIN_DEPENDENCY ${TREE_SRC}
)

# Run flex to generate the lexer
add_custom_command (
    OUTPUT expr_lexer.cpp
    COMMAND flex -o expr_lexer.cpp ${LEXER_SRC}
    MAIN_DEPENDENCY ${LEXER_SRC}
)
 
# Run bison to generate the parser
add_custom_command (
    OUTPUT tokens.h expr_parser.cpp
    COMMAND bison --defines=tokens.h -o expr_parser.cpp ${PARSER_SRC}
    MAIN_DEPENDENCY ${PARSER_SRC}
)
 
include_directories(${CMAKE_CURRENT_BINARY_DIR})
include_directories(${PROJECT_SOURCE_DIR})
 
add_executable(${PROJECT_NAME}  expr_lexer.cpp
                                expr_parser.cpp
                                treecc.cpp
                                main.cpp)
 