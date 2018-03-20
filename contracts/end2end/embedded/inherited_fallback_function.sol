/// @ext:soltest
/// {inherited_fallback_function}
///     // compileAndRun(sourceCode, 0, "B");
///     // ABI_CHECK(callContractFunction("getData()"), encodeArgs(0));
///     // ABI_CHECK(callContractFunction(""), encodeArgs());
///     // ABI_CHECK(callContractFunction("getData()"), encodeArgs(1));
contract A {
	uint data;
	function() { data = 1; }
	function getData() returns (uint r) { return data; }
}
contract B is A {}

