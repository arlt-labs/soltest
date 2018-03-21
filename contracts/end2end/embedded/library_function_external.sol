library Lib { function m(bytes b) external pure returns (byte) { return b[2]; } }
/// @ext:soltest
/// {library_function_external}
///     // compileAndRun(sourceCode, 0, "Lib");
///     // compileAndRun(sourceCode, 0, "Test", bytes(), map<string, Address>{{"Lib", m_contractAddress}});
///     // ABI_CHECK(callContractFunction("f(bytes)", u256(0x20), u256(5), "abcde"), encodeArgs("c"));
contract Test {
	function f(bytes b) public pure returns (byte) {
		return Lib.m(b);
	}
}

