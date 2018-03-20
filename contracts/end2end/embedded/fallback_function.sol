/// @ext:soltest
/// {fallback_function}
///     // compileAndRun(sourceCode);
///     // ABI_CHECK(callContractFunction("getData()"), encodeArgs(0));
///     // ABI_CHECK(callContractFunction(""), encodeArgs());
///     // ABI_CHECK(callContractFunction("getData()"), encodeArgs(1));
contract A {
	uint data;
	function() { data = 1; }
	function getData() returns (uint r) { return data; }
}

