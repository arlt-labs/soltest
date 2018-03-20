/// @ext:soltest
/// {small_signed_types}
///     // compileAndRun(sourceCode);
///     // auto small_signed_types_cpp = []() -> u256
///     // {
///     // 	return -int32_t(10) * -int64_t(20);
///     // };
///     // testContractAgainstCpp("run()", small_signed_types_cpp);
contract test {
	function run() returns(int256 y) {
		return -int32(10) * -int64(20);
	}
}

