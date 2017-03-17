# This file just launches CMake and/or Make.
# NOTE: each command that's on a separate line runs in its own shell.

BUILD_DIR = build
RUN_COMMAND = "./src/myproject"

MAKE = make
CMAKE = cmake
TEST_COMMAND = env CTEST_OUTPUT_ON_FAILURE=true $(MAKE) --no-print-directory test
# To always print test output (not only on failure), change `CTEST_OUTPUT_ON_FAILURE=true` to `ARGS=--verbose`.

default:
	mkdir -p "$(BUILD_DIR)" && cd "$(BUILD_DIR)" && $(CMAKE) .. && $(MAKE) --no-print-directory

.PHONY: run
run: default
	cd "$(BUILD_DIR)" && $(RUN_COMMAND)

.PHONY: test
test: default
	cd "$(BUILD_DIR)" && $(TEST_COMMAND)

.PHONY: clean
clean:
	rm -r "$(BUILD_DIR)"
