/// @ext:soltest
/// {simple_accessor}
///     // compileAndRun(sourceCode);
///     // ABI_CHECK(callContractFunction("data()"), encodeArgs(8));
contract test {
	uint256 public data;
	function test() {
		data = 8;
	}
}

