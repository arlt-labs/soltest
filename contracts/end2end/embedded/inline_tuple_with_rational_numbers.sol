/// @ext:soltest
/// {inline_tuple_with_rational_numbers}
///     // compileAndRun(sourceCode);
///     // ABI_CHECK(callContractFunction("f()"), encodeArgs(u256(1)));
contract c {
	function f() returns (int8) {
		int8[5] memory foo3 = [int8(1), -1, 0, 0, 0];
		return foo3[0];
	}
}

