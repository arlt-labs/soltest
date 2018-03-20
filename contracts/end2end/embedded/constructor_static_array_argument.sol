/// @ext:soltest
/// {constructor_static_array_argument}
///     // compileAndRun(sourceCode, 0, "C", encodeArgs(u256(1), u256(2), u256(3), u256(4)));
///     // ABI_CHECK(callContractFunction("a()"), encodeArgs(u256(1)));
///     // ABI_CHECK(callContractFunction("b(uint256)", u256(0)), encodeArgs(u256(2)));
///     // ABI_CHECK(callContractFunction("b(uint256)", u256(1)), encodeArgs(u256(3)));
///     // ABI_CHECK(callContractFunction("b(uint256)", u256(2)), encodeArgs(u256(4)));
contract C {
	uint public a;
	uint[3] public b;

	function C(uint _a, uint[3] _b) {
		a = _a;
		b = _b;
	}
}

