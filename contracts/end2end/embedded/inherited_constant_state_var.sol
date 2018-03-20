/// @ext:soltest
/// {inherited_constant_state_var}
///     //
///     // compileAndRun(sourceCode, 0, "B");
///     // ABI_CHECK(callContractFunction("f()"), encodeArgs(u256(7)));
contract A {
	uint constant x = 7;
}
contract B is A {
	function f() returns (uint) {
		return A.x;
	}
}

