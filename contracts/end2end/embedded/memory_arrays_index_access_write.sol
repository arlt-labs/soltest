/// @ext:soltest
/// {memory_arrays_index_access_write}
///     // compileAndRun(sourceCode, 0, "Test");
///     //
///     // vector<u256> data(3 * 4);
///     // data[3 * 2 + 2] = 1;
///     // data[3 * 3 + 2] = 7;
///     // ABI_CHECK(callContractFunction("f()"), encodeArgs(data));
contract Test {
	function set(uint24[3][4] x) {
		x[2][2] = 1;
		x[3][2] = 7;
	}
	function f() returns (uint24[3][4]){
		uint24[3][4] memory data;
		set(data);
		return data;
	}
}

