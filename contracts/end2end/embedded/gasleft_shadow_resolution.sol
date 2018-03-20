/// @ext:soltest
/// {gasleft_shadow_resolution}
///     // compileAndRun(sourceCode, 0, "C");
///     // ABI_CHECK(callContractFunction("f()"), encodeArgs(0));
contract C {
	function gasleft() returns(uint256) { return 0; }
	function f() returns(uint256) { return gasleft(); }
}

