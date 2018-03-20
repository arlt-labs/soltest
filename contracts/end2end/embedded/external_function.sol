/// @ext:soltest
/// {external_function}
///     // compileAndRun(sourceCode);
///     // ABI_CHECK(callContractFunction("test(uint256,uint256)", 2, 3), encodeArgs(2+7, 3));
contract c {
	function f(uint a) returns (uint) { return a; }
	function test(uint a, uint b) external returns (uint r_a, uint r_b) {
		r_a = f(a + 7);
		r_b = b;
	}
}

