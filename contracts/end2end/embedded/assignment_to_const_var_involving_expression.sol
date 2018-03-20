/// @ext:soltest
/// {assignment_to_const_var_involving_expression}
///     // compileAndRun(sourceCode);
///     // ABI_CHECK(callContractFunction("f()"), encodeArgs(0x123 + 0x456 + 1));
contract C {
	uint constant x = 0x123 + 0x456;
	function f() returns (uint) { return x + 1; }
}

