/// @ext:soltest
/// {memory_arrays_dynamic_index_access_write}
///     // compileAndRun(sourceCode, 0, "Test");
///     //
///     // vector<u256> data(3 * 4);
///     // data[3 * 2 + 2] = 1;
///     // data[3 * 3 + 2] = 7;
///     // ABI_CHECK(callContractFunction("f()"), encodeArgs(u256(0x20), u256(4), data));
contract Test {
	uint24[3][][4] data;
	function set(uint24[3][][4] x) internal returns (uint24[3][][4]) {
		x[1][2][2] = 1;
		x[1][3][2] = 7;
		return x;
	}
	function f() returns (uint24[3][]) {
		data[1].length = 4;
		return set(data)[1];
	}
}

