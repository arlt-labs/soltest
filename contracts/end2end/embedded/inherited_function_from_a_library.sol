library A { function f() internal returns (uint) { return 1; } }
/// @ext:soltest
/// {inherited_function_from_a_library}
///     //
///     // compileAndRun(sourceCode, 0, "B");
///     // ABI_CHECK(callContractFunction("g()"), encodeArgs(u256(1)));
contract B {
	function f() internal returns (uint) { return 2; }
	function g() returns (uint) {
		return A.f();
	}
}

