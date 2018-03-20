/// @ext:soltest
/// {shift_cleanup}
///     // compileAndRun(sourceCode, 0, "C");
///     // ABI_CHECK(callContractFunction("f()"), encodeArgs(u256(0x0)));
contract C {
	function f() returns (uint16 x) {
		x = 0xffff;
		x += 32;
		x <<= 8;
		x >>= 16;
	}
}

