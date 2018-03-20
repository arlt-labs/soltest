/// @ext:soltest
/// {inline_array_storage_to_memory_conversion_ints}
///     // compileAndRun(sourceCode, 0, "C");
///     // ABI_CHECK(callContractFunction("f()"), encodeArgs(3, 6));
contract C {
	function f() returns (uint x, uint y) {
		x = 3;
		y = 6;
		uint[2] memory z = [x, y];
		return (z[0], z[1]);
	}
}

