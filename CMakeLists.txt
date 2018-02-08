# For basic CMake usage, see <http://www.cmake.org/cmake-tutorial/> and
# <https://stackoverflow.com/questions/31037882/whats-the-cmake-syntax-to-set-and-use-variables>.
# For antipatterns to avoid, see <http://stackoverflow.com/questions/2110795/how-to-find-all-c-files-for-cmake-build-system>
# and <http://voices.canonical.com/jussi.pakkanen/2013/03/26/a-list-of-common-cmake-antipatterns/>.

cmake_minimum_required (VERSION 2.6)

project ("myproject")
#set(PROJECT_VERSION_MAJOR 0)
#set(PROJECT_VERSION_MINOR 1)
#set(PROJECT_VERSION_PATCH 0)

#set(CMAKE_MODULE_PATH "${CMAKE_SOURCE_DIR}/cmake")

set(CMAKE_BUILD_TYPE RelWithDebInfo) # Debug, RelWithDebInfo, Release.
#set(CMAKE_VERBOSE_MAKEFILE TRUE)

# Profiling.
#set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -pg")

# Sanitizers (like Valgrind, but compile-time).
set(sanitizers_enable_debug TRUE)
if(sanitizers_enable_debug)
  # Each of these sanitizers will increase memory usage and processing time about 2x.
  set(sanitizer_flags_debug "-fsanitize=address,leak,memory,undefined")
else()
  set(sanitizer_flags_debug "")
endif()
set(CMAKE_EXE_LINKER_FLAGS_DEBUG "${CMAKE_EXE_LINKER_FLAGS} ${sanitizer_flags_debug}")

# Static linking.
set(build_static FALSE)
if(build_static)
  set(BUILD_SHARED_LIBRARIES OFF)
  set(CMAKE_FIND_LIBRARY_SUFFIXES ".a")
  set(CMAKE_EXE_LINKER_FLAGS "${CMAKE_EXE_LINKER_FLAGS} -static -static-libgcc")
endif()

# Compilation flags.
set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} --std=c99")
set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -Wall -Wextra -Werror=implicit-function-declaration")
set(CMAKE_C_FLAGS_DEBUG "-g ${sanitizer_flags_debug}")
set(CMAKE_C_FLAGS_RELWITHDEBINFO "-O2 -g -DNDEBUG")
set(CMAKE_C_FLAGS_RELEASE "-O3 -DNDEBUG")
# Compilation flags for C++.
#set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} --std=c++11")
#set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -Wall -Wextra -Werror=implicit-function-declaration")
#set(CMAKE_CXX_FLAGS_DEBUG "-g ${sanitizer_flags_debug}")
#set(CMAKE_CXX_FLAGS_RELWITHDEBINFO "-O2 -g -NDEBUG")
#set(CMAKE_CXX_FLAGS_RELEASE "-O3 -NDEBUG")

# Enable modern UNIX features.
#add_definitions(-D_POSIX_C_SOURCE=200809L)

# Testing.
enable_testing()
set(BUILD_TESTING TRUE)
# This is a much simpler version of `include(CTest)`
# (which would add a lot of things that I don't need to the project).

add_subdirectory("src")
if(BUILD_TESTING)
  add_subdirectory("test")
endif()
