/// @ext:soltest
/// {exp_operator_const_signed}
///     // compileAndRun(sourceCode);
///     // ABI_CHECK(callContractFunction("f()", bytes()), toBigEndian(u256(-8)));
contract test {
	function f() returns(int d) { return (-2) ** 3; }
}

