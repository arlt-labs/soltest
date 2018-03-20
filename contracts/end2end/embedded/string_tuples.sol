/// @ext:soltest
/// {string_tuples}
///     // compileAndRun(sourceCode);
///     // ABI_CHECK(callContractFunction("f()"), encodeArgs(u256(0x40), u256(8), u256(3), string("abc")));
///     // ABI_CHECK(callContractFunction("g()"), encodeArgs(u256(0x40), u256(0x80), u256(3), string("abc"), u256(3), string("def")));
contract C {
	function f() returns (string, uint) {
		return ("abc", 8);
	}
	function g() returns (string, string) {
		return (h(), "def");
	}
	function h() returns (string) {
		return ("abc",);
	}
}

