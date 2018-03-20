/// @ext:soltest
/// {create_dynamic_array_with_zero_length}
///     // compileAndRun(sourceCode, 0, "C");
///     // ABI_CHECK(callContractFunction("f()"), encodeArgs(u256(7)));
contract C {
	function f() returns (uint) {
		var a = new uint[][](0);
		return 7;
	}
}

