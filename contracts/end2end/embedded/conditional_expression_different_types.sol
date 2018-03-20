/// @ext:soltest
/// {conditional_expression_different_types}
///     // compileAndRun(sourceCode);
///     // ABI_CHECK(callContractFunction("f(bool)", true), encodeArgs(u256(0xcd)));
///     // ABI_CHECK(callContractFunction("f(bool)", false), encodeArgs(u256(0xabab)));
contract test {
	function f(bool cond) returns (uint) {
		uint8 x = 0xcd;
		uint16 y = 0xabab;
		return cond ? x : y;
	}
}

