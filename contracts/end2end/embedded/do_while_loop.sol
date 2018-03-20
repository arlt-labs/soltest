/// @ext:soltest
/// {do_while_loop}
///     // compileAndRun(sourceCode);
///     //
///     // auto do_while_loop_cpp = [](u256 const& n) -> u256
///     // {
///     // 	u256 nfac = 1;
///     // 	u256 i = 2;
///     // 	do
///     // 	{
///     // 		nfac *= i++;
///     // 	}
///     // 	while (i <= n);
///     //
///     // 	return nfac;
///     // };
///     //
///     // testContractAgainstCppOnRange("f(uint256)", do_while_loop_cpp, 0, 5);
contract test {
	function f(uint n) returns(uint nfac) {
		nfac = 1;
		var i = 2;
		do { nfac *= i++; } while (i <= n);
	}
}

