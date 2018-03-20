/// @ext:soltest
/// {memory_overwrite}
///     // compileAndRun(sourceCode);
///     // ABI_CHECK(callContractFunction("f()"), encodeDyn(string("b23a5")));
contract C {
	function f() returns (bytes x) {
		x = "12345";
		x[3] = 0x61;
		x[0] = 0x62;
	}
}

