/// @ext:soltest
/// {simple_constant_variables_test}
///     // compileAndRun(sourceCode);
///     // ABI_CHECK(callContractFunction("getX()"), encodeArgs(56));
contract Foo {
	function getX() returns (uint r) { return x; }
	uint constant x = 56;
}

