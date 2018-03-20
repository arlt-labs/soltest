/// @ext:soltest
/// {shift_negative_rvalue_assignment}
///     // compileAndRun(sourceCode, 0, "C");
///     // ABI_CHECK(callContractFunction("f(int256,int256)", u256(1), u256(-1)), encodeArgs());
///     // ABI_CHECK(callContractFunction("g(int256,int256)", u256(1), u256(-1)), encodeArgs());
contract C {
	function f(int a, int b) returns (int) {
		a <<= b;
		return a;
	}
	function g(int a, int b) returns (int) {
		a >>= b;
		return a;
	}
}

