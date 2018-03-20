/// @ext:soltest
/// {exp_operator_const}
///     // compileAndRun(sourceCode);
///     // ABI_CHECK(callContractFunction("f()", bytes()), toBigEndian(u256(8)));
contract test {
	function f() returns(uint d) { return 2 ** 3; }
}

