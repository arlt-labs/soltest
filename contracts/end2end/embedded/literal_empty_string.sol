/// @ext:soltest
/// {literal_empty_string}
///     // compileAndRun(sourceCode, 0, "C");
///     // ABI_CHECK(callContractFunction("x()"), encodeArgs(u256(0)));
///     // ABI_CHECK(callContractFunction("a()"), encodeArgs(u256(0)));
///     // ABI_CHECK(callContractFunction("g()"), encodeArgs());
///     // ABI_CHECK(callContractFunction("x()"), encodeArgs(u256(0)));
///     // ABI_CHECK(callContractFunction("a()"), encodeArgs(u256(2)));
contract C {
	bytes32 public x;
	uint public a;
	function f(bytes32 _x, uint _a) {
		x = _x;
		a = _a;
	}
	function g() {
		this.f("", 2);
	}
}

