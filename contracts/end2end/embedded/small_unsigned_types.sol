/// @ext:soltest
/// {small_unsigned_types}
///     // compileAndRun(sourceCode);
///     // auto small_unsigned_types_cpp = []() -> u256
///     // {
///     // 	uint32_t t = uint32_t(0xffffff);
///     // 	uint32_t x = t * 0xffffff;
///     // 	return x / 0x100;
///     // };
///     // testContractAgainstCpp("run()", small_unsigned_types_cpp);
contract test {
	function run() returns(uint256 y) {
		uint32 t = uint32(0xffffff);
		uint32 x = t * 0xffffff;
		return x / 0x100;
	}
}

