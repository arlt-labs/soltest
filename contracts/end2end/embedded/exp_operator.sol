/// @ext:soltest
/// {exp_operator}
///     // compileAndRun(sourceCode);
///     // testContractAgainstCppOnRange("f(uint256)", [](u256 const& a) -> u256 { return u256(1 << a.convert_to<int>()); }, 0, 16);
contract test {
	function f(uint a) returns(uint d) { return 2 ** a; }
}

