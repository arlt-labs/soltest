/// @ext:soltest
/// {overloaded_function_call_resolve_to_first}
///     // compileAndRun(sourceCode);
///     // ABI_CHECK(callContractFunction("g()"), encodeArgs(3));
contract test {
	function f(uint k) returns(uint d) { return k; }
	function f(uint a, uint b) returns(uint d) { return a + b; }
	function g() returns(uint d) { return f(3); }
}

