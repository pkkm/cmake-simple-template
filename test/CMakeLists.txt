add_definitions(-DTEST)
include_directories("${PROJECT_SOURCE_DIR}/src")

set(valgrind_enable FALSE)
set(valgrind_flags --error-exitcode=1 --read-var-info=yes --leak-check=full --show-leak-kinds=all)

set(tests_to_add) # We collect the tests to add and add them later in order to run the non-Valgrind ones first (because they're much faster).
function(add_test_dwim name)
  add_executable("${name}" "${name}.c")
  set(tests_to_add ${tests_to_add} "${name}" PARENT_SCOPE)
  target_link_libraries("${name}" cmocka ${ARGN}) # ${ARGN} -- arguments past the required one.
endfunction(add_test_dwim)

add_test_dwim(test_hello src_hello)

foreach(name ${tests_to_add})
  add_test("${name}" "./${name}")
endforeach()

if(valgrind_enable)
  foreach(name ${tests_to_add})
    add_test("${name}_valgrind" valgrind ${valgrind_flags} "./${name}")
  endforeach()
endif()
