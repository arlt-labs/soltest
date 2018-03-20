/// @ext:soltest
/// {constant_var_as_array_length}
///     // compileAndRun(sourceCode, 0, "C", encodeArgs(u256(1), u256(2), u256(3)));
///     // ABI_CHECK(callContractFunction("a(uint256)", u256(0)), encodeArgs(u256(1)));
///     // ABI_CHECK(callContractFunction("a(uint256)", u256(1)), encodeArgs(u256(2)));
///     // ABI_CHECK(callContractFunction("a(uint256)", u256(2)), encodeArgs(u256(3)));
contract C {
	uint constant LEN = 3;
	uint[LEN] public a;

	function C(uint[LEN] _a) {
		a = _a;
	}
}

