/// @ext:soltest
/// {scientific_notation}
///     // compileAndRun(sourceCode, 0, "C");
///     // ABI_CHECK(callContractFunction("f()"), encodeArgs(u256(20000000000)));
///     // ABI_CHECK(callContractFunction("g()"), encodeArgs(u256(2)));
///     // ABI_CHECK(callContractFunction("h()"), encodeArgs(u256(25)));
///     // ABI_CHECK(callContractFunction("i()"), encodeArgs(u256(-20000000000)));
///     // ABI_CHECK(callContractFunction("j()"), encodeArgs(u256(-2)));
///     // ABI_CHECK(callContractFunction("k()"), encodeArgs(u256(-25)));
contract C {
	function f() returns (uint) {
		return 2e10 wei;
	}
	function g() returns (uint) {
		return 200e-2 wei;
	}
	function h() returns (uint) {
		return 2.5e1;
	}
	function i() returns (int) {
		return -2e10;
	}
	function j() returns (int) {
		return -200e-2;
	}
	function k() returns (int) {
		return -2.5e1;
	}
}

