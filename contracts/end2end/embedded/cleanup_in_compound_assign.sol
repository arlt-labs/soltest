/// @ext:soltest
/// {cleanup_in_compound_assign}
///     // compileAndRun(sourceCode, 0, "C");
///     // ABI_CHECK(callContractFunction("test()"), encodeArgs(u256(0xff), u256(0xff)));
contract C {
	function test() returns (uint, uint) {
		uint32 a = 0xffffffff;
		uint16 x = uint16(a);
		uint16 y = x;
		x /= 0x100;
		y = y / 0x100;
		return (x, y);
	}
}

