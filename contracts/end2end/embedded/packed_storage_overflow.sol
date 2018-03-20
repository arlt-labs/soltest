/// @ext:soltest
/// {packed_storage_overflow}
///     // compileAndRun(sourceCode, 0, "C");
///     // ABI_CHECK(callContractFunction("f()"), encodeArgs(u256(0x1234), u256(0), u256(0), u256(0xfffe)));
contract C {
	uint16 x = 0x1234;
	uint16 a = 0xffff;
	uint16 b;
	function f() returns (uint, uint, uint, uint) {
		a++;
		uint c = b;
		delete b;
		a -= 2;
		return (x, c, b, a);
	}
}

