# Main binary.
set (binary_name "${PROJECT_NAME}")
add_executable ("${binary_name}" main.cpp)

# Compilation flags.
set (CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} --std=c++11")
set (CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -Wall -Wextra -Werror=implicit-function-declaration -Wstrict-overflow=5")
set (CMAKE_CXX_FLAGS_DEBUG "-O0 -g")
set (CMAKE_CXX_FLAGS_RELWITHDEBINFO "-O2 -g")
set (CMAKE_CXX_FLAGS_RELEASE "-O3")
