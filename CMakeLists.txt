# For basic CMake usage, see the tutorial: <http://www.cmake.org/cmake-tutorial/>.
# For antipatterns to avoid, see <http://stackoverflow.com/questions/2110795/how-to-find-all-c-files-for-cmake-build-system> and <http://voices.canonical.com/jussi.pakkanen/2013/03/26/a-list-of-common-cmake-antipatterns/>.

cmake_minimum_required (VERSION 2.6)

project ("myproject")
set (PROJECT_VERSION_MAJOR 0)
set (PROJECT_VERSION_MINOR 1)
set (PROJECT_VERSION_PATCH 0)

set (CMAKE_BUILD_TYPE RelWithDebInfo) # Debug, RelWithDebInfo, Release.
set (CMAKE_RUNTIME_OUTPUT_DIRECTORY "${PROJECT_BINARY_DIR}/bin")

add_subdirectory ("src")
