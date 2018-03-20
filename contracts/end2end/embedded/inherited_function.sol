/// @ext:soltest
/// {inherited_function}
///     //
///     // compileAndRun(sourceCode, 0, "B");
///     // ABI_CHECK(callContractFunction("g()"), encodeArgs(u256(1)));
contract A { function f() internal returns (uint) { return 1; } }
contract B is A {
	function f() internal returns (uint) { return 2; }
	function g() returns (uint) {
		return A.f();
	}
}

