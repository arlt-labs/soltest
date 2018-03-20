/// @ext:soltest
/// {simple_throw}
///     // compileAndRun(sourceCode);
///     // ABI_CHECK(callContractFunction("f(uint256)", u256(11)), encodeArgs(u256(21)));
///     // ABI_CHECK(callContractFunction("f(uint256)", u256(1)), encodeArgs());
contract Test {
	function f(uint x) returns (uint) {
		if (x > 10)
			return x + 10;
		else
			throw;
		return 2;
	}
}

