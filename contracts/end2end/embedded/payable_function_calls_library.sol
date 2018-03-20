library L {
	function f() returns (uint) { return 7; }
}
/// @ext:soltest
/// {payable_function_calls_library}
///     // compileAndRun(sourceCode, 0, "L");
///     // compileAndRun(sourceCode, 0, "C", bytes(), map<string, Address>{{"L", m_contractAddress}});
///     // ABI_CHECK(callContractFunctionWithValue("f()", 27), encodeArgs(u256(7)));
contract C {
	function f() payable returns (uint) {
		return L.f();
	}
}

