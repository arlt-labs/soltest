/// @ext:soltest
/// {shift_constant_right_assignment}
///     // compileAndRun(sourceCode, 0, "C");
///     // ABI_CHECK(callContractFunction("f()"), encodeArgs(u256(0x42)));
contract C {
	function f() returns (uint a) {
		a = 0x4200;
		a >>= 8;
	}
}

