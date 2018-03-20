/// @ext:soltest
/// {conditional_expression_true_literal}
///     // compileAndRun(sourceCode);
///     // ABI_CHECK(callContractFunction("f()", bytes()), toBigEndian(u256(5)));
contract test {
	function f() returns(uint d) {
		return true ? 5 : 10;
	}
}

