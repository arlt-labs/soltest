/// @ext:soltest
/// {shift_right}
///     // compileAndRun(sourceCode, 0, "C");
///     // ABI_CHECK(callContractFunction("f(uint256,uint256)", u256(0x4266), u256(0)), encodeArgs(u256(0x4266)));
///     // ABI_CHECK(callContractFunction("f(uint256,uint256)", u256(0x4266), u256(8)), encodeArgs(u256(0x42)));
///     // ABI_CHECK(callContractFunction("f(uint256,uint256)", u256(0x4266), u256(16)), encodeArgs(u256(0)));
///     // ABI_CHECK(callContractFunction("f(uint256,uint256)", u256(0x4266), u256(17)), encodeArgs(u256(0)));
contract C {
	function f(uint a, uint b) returns (uint) {
		return a >> b;
	}
}

