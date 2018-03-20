/// @ext:soltest
/// {multiple_inherited_state_vars}
///     //
///     // compileAndRun(sourceCode, 0, "C");
///     // ABI_CHECK(callContractFunction("a()"), encodeArgs(u256(7)));
///     // ABI_CHECK(callContractFunction("b()"), encodeArgs(u256(9)));
///     // ABI_CHECK(callContractFunction("a_set(uint256)", u256(1)), encodeArgs(u256(1)));
///     // ABI_CHECK(callContractFunction("b_set(uint256)", u256(3)), encodeArgs(u256(1)));
///     // ABI_CHECK(callContractFunction("a()"), encodeArgs(u256(1)));
///     // ABI_CHECK(callContractFunction("b()"), encodeArgs(u256(3)));
contract A {
	uint x = 7;
}
contract B {
	uint x = 9;
}
contract C is A, B {
	function a() returns (uint) {
		return A.x;
	}
	function b() returns (uint) {
		return B.x;
	}
	function a_set(uint _x) returns (uint) {
		A.x = _x;
		return 1;
	}
	function b_set(uint _x) returns (uint) {
		B.x = _x;
		return 1;
	}
}

