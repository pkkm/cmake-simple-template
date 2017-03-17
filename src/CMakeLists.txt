set(binary_name "${PROJECT_NAME}")
add_executable("${binary_name}" main.c)

add_library(src_hello hello.c)
target_link_libraries("${binary_name}" src_hello)
