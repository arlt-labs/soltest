/// @ext:soltest
/// {short_circuiting}
///     // compileAndRun(sourceCode);
///     //
///     // auto short_circuiting_cpp = [](u256 n) -> u256
///     // {
///     // 	(void)(n == 0 || (n = 8) > 0);
///     // 	return n;
///     // };
///     //
///     // testContractAgainstCppOnRange("run(uint256)", short_circuiting_cpp, 0, 2);
contract test {
	function run(uint x) returns(uint y) {
		x == 0 || ((x = 8) > 0);
		return x;
	}
}

