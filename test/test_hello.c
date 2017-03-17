// For cmocka.
#include <stdarg.h>
#include <stddef.h>
#include <setjmp.h>
#include <cmocka.h>

#include "hello.h"

static int init() {
	return 0;
}

static int shutdown() {
	return 0;
}

static void test_hello_string() {
	assert_string_equal(hello_string(), "Hello, world!");
}

int main(void) {
	const struct CMUnitTest tests[] = {
		cmocka_unit_test(test_hello_string),
	};

	return cmocka_run_group_tests(tests, init, shutdown);
}
