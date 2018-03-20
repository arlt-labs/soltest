/// @ext:soltest
/// {pass_function_types_externally}
///     //
///     // compileAndRun(sourceCode, 0, "C");
///     // ABI_CHECK(callContractFunction("f(uint256)", 7), encodeArgs(u256(8)));
///     // ABI_CHECK(callContractFunction("f2(uint256)", 7), encodeArgs(u256(8)));
contract C {
	function f(uint x) returns (uint) {
		return this.eval(this.g, x);
	}
	function f2(uint x) returns (uint) {
		return eval(this.g, x);
	}
	function eval(function(uint) external returns (uint) x, uint a) returns (uint) {
		return x(a);
	}
	function g(uint x) returns (uint) { return x + 1; }
}

