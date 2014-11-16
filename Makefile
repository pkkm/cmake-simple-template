# This makefile just calls the CMake build system.

RUN_PROGRAM_COMMAND = "./bin/myproject"
BUILD_DIR = build
# Can't contain special characters or have the same name as one of the rules in this file.

default: make

# Build the project (if $(BUILD_DIR) exists, assume that CMake has been run and run only make).
.PHONY: make
make:
	cd "$(BUILD_DIR)"; make
# This needs to be on one line, otherwise the commands would run in separate subshells.

# If $(BUILD_DIR) doesn't exist, create it and run CMake.
make: | $(BUILD_DIR)
$(BUILD_DIR):
	mkdir "$(BUILD_DIR)"
	cd "$(BUILD_DIR)"; cmake ..

# Run the program.
.PHONY: run
run:
	cd "$(BUILD_DIR)"; $(RUN_PROGRAM_COMMAND)

# Compile and run.
.PHONY: compile-run
compile-run: make run

# Remove $(BUILD_DIR).
.PHONY: clean
clean:
	rm -rf "$(BUILD_DIR)"
