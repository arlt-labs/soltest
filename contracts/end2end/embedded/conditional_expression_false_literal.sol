/// @ext:soltest
/// {conditional_expression_false_literal}
///     // compileAndRun(sourceCode);
///     // ABI_CHECK(callContractFunction("f()", bytes()), toBigEndian(u256(10)));
contract test {
	function f() returns(uint d) {
		return false ? 5 : 10;
	}
}

