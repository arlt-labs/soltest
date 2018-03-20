/// @ext:soltest
/// {shift_left_larger_type}
///     // compileAndRun(sourceCode, 0, "C");
///     // ABI_CHECK(callContractFunction("f()"), encodeArgs(u256(0)));
contract C {
	function f() returns (int8) {
		uint8 x = 254;
		int8 y = 1;
		return y << x;
	}
}

