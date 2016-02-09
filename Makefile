# This file just launches CMake and/or Make.
# NOTE: each command that's on a separate line runs in its own shell.

BUILD_DIR = build
RUN_COMMAND = "./src/myproject"

MAKE = make
CMAKE = cmake

default:
ifneq ("$(wildcard $(BUILD_DIR))","") # If $(BUILD_DIR) exists...
	cd "$(BUILD_DIR)" && $(MAKE)
else
	mkdir "$(BUILD_DIR)" && cd "$(BUILD_DIR)" && $(CMAKE) .. && $(MAKE)
endif

.PHONY: run
run:
	cd "$(BUILD_DIR)" && $(RUN_COMMAND)

.PHONY: clean
clean:
	rm -r "$(BUILD_DIR)"
