/// @ext:soltest
/// {assert_require}
///     // compileAndRun(sourceCode, 0, "C");
///     // ABI_CHECK(callContractFunction("f()"), encodeArgs());
///     // ABI_CHECK(callContractFunction("g(bool)", false), encodeArgs());
///     // ABI_CHECK(callContractFunction("g(bool)", true), encodeArgs(true));
///     // ABI_CHECK(callContractFunction("h(bool)", false), encodeArgs());
///     // ABI_CHECK(callContractFunction("h(bool)", true), encodeArgs(true));
contract C {
	function f() {
		assert(false);
	}
	function g(bool val) returns (bool) {
		assert(val == true);
		return true;
	}
	function h(bool val) returns (bool) {
		require(val);
		return true;
	}
}

