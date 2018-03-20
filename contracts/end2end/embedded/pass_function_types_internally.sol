/// @ext:soltest
/// {pass_function_types_internally}
///     //
///     // compileAndRun(sourceCode, 0, "C");
///     // ABI_CHECK(callContractFunction("f(uint256)", 7), encodeArgs(u256(8)));
contract C {
	function f(uint x) returns (uint) {
		return eval(g, x);
	}
	function eval(function(uint) returns (uint) x, uint a) internal returns (uint) {
		return x(a);
	}
	function g(uint x) returns (uint) { return x + 1; }
}

