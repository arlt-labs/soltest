/// @ext:soltest
/// {smoke_test}
///     // compileAndRun(sourceCode);
///     // testContractAgainstCppOnRange("f(uint256)", [](u256 const& a) -> u256 { return a * 7; }, 0, 100);
contract test {
	function f(uint a) returns(uint d) { return a * 7; }
}

