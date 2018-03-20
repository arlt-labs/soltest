/// @ext:soltest
/// {copy_function_storage_array}
///     //
///     // compileAndRun(sourceCode, 0, "C");
///     // ABI_CHECK(callContractFunction("test()"), encodeArgs(u256(7)));
contract C {
	function() internal returns (uint)[] x;
	function() internal returns (uint)[] y;
	function test() returns (uint) {
		x.length = 10;
		x[9] = a;
		y = x;
		return y[9]();
	}
	function a() returns (uint) {
		return 7;
	}
}

