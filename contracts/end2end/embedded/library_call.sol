library Lib { function m(uint x, uint y) returns (uint) { return x * y; } }
/// @ext:soltest
/// {library_call}
///     // compileAndRun(sourceCode, 0, "Lib");
///     // compileAndRun(sourceCode, 0, "Test", bytes(), map<string, Address>{{"Lib", m_contractAddress}});
///     // ABI_CHECK(callContractFunction("f(uint256)", u256(33)), encodeArgs(u256(33) * 9));
contract Test {
	function f(uint x) returns (uint) {
		return Lib.m(x, 9);
	}
}

