/// @ext:soltest
/// {return_external_function_type}
///     //
///     // compileAndRun(sourceCode, 0, "C");
///     // ABI_CHECK(
///     // 	callContractFunction("f()"),
///     // 	m_contractAddress.asBytes() + FixedHash<4>(dev::keccak256("g()")).asBytes() + bytes(32 - 4 - 20, 0)
///     // );
contract C {
	function g() {}
	function f() returns (function() external) {
		return this.g;
	}
}

