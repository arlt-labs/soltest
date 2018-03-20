/// @ext:soltest
/// {state_variable_local_variable_mixture}
///     //
///     // compileAndRun(sourceCode);
///     // ABI_CHECK(callContractFunction("a()"), encodeArgs(u256(2)));
contract A {
	uint x = 1;
	uint y = 2;
	function a() returns (uint x) {
		x = A.y;
	}
}

