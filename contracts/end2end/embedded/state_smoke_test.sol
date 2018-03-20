/// @ext:soltest
/// {state_smoke_test}
///     // compileAndRun(sourceCode);
///     // ABI_CHECK(callContractFunction("get(uint8)", byte(0x00)), encodeArgs(0));
///     // ABI_CHECK(callContractFunction("get(uint8)", byte(0x01)), encodeArgs(0));
///     // ABI_CHECK(callContractFunction("set(uint8,uint256)", byte(0x00), 0x1234), encodeArgs());
///     // ABI_CHECK(callContractFunction("set(uint8,uint256)", byte(0x01), 0x8765), encodeArgs());
///     // ABI_CHECK(callContractFunction("get(uint8)", byte( 0x00)), encodeArgs(0x1234));
///     // ABI_CHECK(callContractFunction("get(uint8)", byte(0x01)), encodeArgs(0x8765));
///     // ABI_CHECK(callContractFunction("set(uint8,uint256)", byte(0x00), 0x3), encodeArgs());
///     // ABI_CHECK(callContractFunction("get(uint8)", byte(0x00)), encodeArgs(0x3));
contract test {
	uint256 value1;
	uint256 value2;
	function get(uint8 which) returns (uint256 value) {
		if (which == 0) return value1;
		else return value2;
	}
	function set(uint8 which, uint256 value) {
		if (which == 0) value1 = value;
		else value2 = value;
	}
}

