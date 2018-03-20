/// @ext:soltest
/// {default_fallback_throws}
///     // compileAndRun(sourceCode);
///     // ABI_CHECK(callContractFunction("f()"), encodeArgs(0));
contract A {
	function f() returns (bool) {
		return this.call();
	}
}

