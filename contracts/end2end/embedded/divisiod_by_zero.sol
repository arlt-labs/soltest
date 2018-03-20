/// @ext:soltest
/// {divisiod_by_zero}
///     // compileAndRun(sourceCode);
///     // ABI_CHECK(callContractFunction("div(uint256,uint256)", 7, 2), encodeArgs(u256(3)));
///     // // throws
///     // ABI_CHECK(callContractFunction("div(uint256,uint256)", 7, 0), encodeArgs());
///     // ABI_CHECK(callContractFunction("mod(uint256,uint256)", 7, 2), encodeArgs(u256(1)));
///     // // throws
///     // ABI_CHECK(callContractFunction("mod(uint256,uint256)", 7, 0), encodeArgs());
contract C {
	function div(uint a, uint b) returns (uint) {
		return a / b;
	}
	function mod(uint a, uint b) returns (uint) {
		return a % b;
	}
}

