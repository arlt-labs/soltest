/// @ext:soltest
/// {cleanup_bytes_types}
///     // compileAndRun(sourceCode, 0, "C");
///     // // We input longer data on purpose.
///     // ABI_CHECK(callContractFunction("f(bytes2,uint16)", string("abc"), u256(0x040102)), encodeArgs(0));
contract C {
	function f(bytes2 a, uint16 x) returns (uint) {
		if (a != "ab") return 1;
		if (x != 0x0102) return 2;
		if (bytes3(x) != 0x0102) return 3;
		return 0;
	}
}

