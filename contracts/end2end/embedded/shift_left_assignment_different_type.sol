/// @ext:soltest
/// {shift_left_assignment_different_type}
///     // compileAndRun(sourceCode, 0, "C");
///     // ABI_CHECK(callContractFunction("f(uint256,uint8)", u256(0x4266), u256(0)), encodeArgs(u256(0x4266)));
///     // ABI_CHECK(callContractFunction("f(uint256,uint8)", u256(0x4266), u256(8)), encodeArgs(u256(0x426600)));
///     // ABI_CHECK(callContractFunction("f(uint256,uint8)", u256(0x4266), u256(16)), encodeArgs(u256(0x42660000)));
///     // ABI_CHECK(callContractFunction("f(uint256,uint8)", u256(0x4266), u256(17)), encodeArgs(u256(0x84cc0000)));
///     // ABI_CHECK(callContractFunction("f(uint256,uint8)", u256(0x4266), u256(240)), fromHex("4266000000000000000000000000000000000000000000000000000000000000"));
contract C {
	function f(uint a, uint8 b) returns (uint) {
		a <<= b;
		return a;
	}
}

