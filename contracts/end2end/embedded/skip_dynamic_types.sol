/// @ext:soltest
/// {skip_dynamic_types}
///     // compileAndRun(sourceCode, 0, "C");
///     // ABI_CHECK(callContractFunction("g()"), encodeArgs(u256(7), u256(8)));
contract C {
	function f() returns (uint, uint[], uint) {
		return (7, new uint[](2), 8);
	}
	function g() returns (uint, uint) {
		// Previous implementation "moved" b to the second place and did not skip.
		var (a, _, b) = this.f();
		return (a, b);
	}
}

