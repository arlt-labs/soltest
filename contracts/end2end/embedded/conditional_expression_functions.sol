/// @ext:soltest
/// {conditional_expression_functions}
///     // compileAndRun(sourceCode);
///     // ABI_CHECK(callContractFunction("f(bool)", true), encodeArgs(u256(1)));
///     // ABI_CHECK(callContractFunction("f(bool)", false), encodeArgs(u256(2)));
contract test {
	function x() returns (uint) { return 1; }
	function y() returns (uint) { return 2; }

	function f(bool cond) returns (uint) {
		var z = cond ? x : y;
		return z();
	}
}

