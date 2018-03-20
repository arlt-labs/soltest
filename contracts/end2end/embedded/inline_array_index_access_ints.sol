/// @ext:soltest
/// {inline_array_index_access_ints}
///     // compileAndRun(sourceCode, 0, "C");
///     // ABI_CHECK(callContractFunction("f()"), encodeArgs(3));
contract C {
	function f() returns (uint) {
		return ([1, 2, 3, 4][2]);
	}
}

