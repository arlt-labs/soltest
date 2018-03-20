/// @ext:soltest
/// {conditional_expression_multiple}
///     // compileAndRun(sourceCode);
///     // ABI_CHECK(callContractFunction("f(uint256)", u256(1001)), toBigEndian(u256(1000)));
///     // ABI_CHECK(callContractFunction("f(uint256)", u256(500)), toBigEndian(u256(100)));
///     // ABI_CHECK(callContractFunction("f(uint256)", u256(80)), toBigEndian(u256(50)));
///     // ABI_CHECK(callContractFunction("f(uint256)", u256(40)), toBigEndian(u256(10)));
contract test {
	function f(uint x) returns(uint d) {
		return x > 100 ?
					x > 1000 ? 1000 : 100
					:
					x > 50 ? 50 : 10;
	}
}

