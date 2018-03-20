/// @ext:soltest
/// {packed_storage_signed}
///     // compileAndRun(sourceCode);
///     // ABI_CHECK(callContractFunction("test()"), encodeArgs(u256(-2), u256(4), u256(-112), u256(0)));
contract C {
	int8 a;
	uint8 b;
	int8 c;
	uint8 d;
	function test() returns (uint x1, uint x2, uint x3, uint x4) {
		a = -2;
		b = -uint8(a) * 2;
		c = a * int8(120) * int8(121);
		x1 = uint(a);
		x2 = b;
		x3 = uint(c);
		x4 = d;
	}
}

