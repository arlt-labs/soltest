/// @ext:soltest
/// {constant_string}
///     // compileAndRun(sourceCode, 0, "C");
///     // ABI_CHECK(callContractFunction("f()"), encodeDyn(string("\x03\x01\x02")));
///     // ABI_CHECK(callContractFunction("g()"), encodeDyn(string("\x03\x01\x02")));
///     // ABI_CHECK(callContractFunction("h()"), encodeDyn(string("hello")));
contract C {
	bytes constant a = "\x03\x01\x02";
	bytes constant b = hex"030102";
	string constant c = "hello";
	function f() returns (bytes) {
		return a;
	}
	function g() returns (bytes) {
		return b;
	}
	function h() returns (bytes) {
		return bytes(c);
	}
}

