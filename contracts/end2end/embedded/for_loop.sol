/// @ext:soltest
/// {for_loop}
///     // compileAndRun(sourceCode);
///     //
///     // auto for_loop_cpp = [](u256 const& n) -> u256
///     // {
///     // 	u256 nfac = 1;
///     // 	for (auto i = 2; i <= n; i++)
///     // 		nfac *= i;
///     // 	return nfac;
///     // };
///     //
///     // testContractAgainstCppOnRange("f(uint256)", for_loop_cpp, 0, 5);
contract test {
	function f(uint n) returns(uint nfac) {
		nfac = 1;
		for (var i = 2; i <= n; i++)
			nfac *= i;
	}
}

