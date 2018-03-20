/// @ext:soltest
/// {multiple_functions}
///     // compileAndRun(sourceCode);
///     // ABI_CHECK(callContractFunction("a()", bytes()), toBigEndian(u256(0)));
///     // ABI_CHECK(callContractFunction("b()", bytes()), toBigEndian(u256(1)));
///     // ABI_CHECK(callContractFunction("c()", bytes()), toBigEndian(u256(2)));
///     // ABI_CHECK(callContractFunction("f()", bytes()), toBigEndian(u256(3)));
///     // ABI_CHECK(callContractFunction("i_am_not_there()", bytes()), bytes());
contract test {
	function a() returns(uint n) { return 0; }
	function b() returns(uint n) { return 1; }
	function c() returns(uint n) { return 2; }
	function f() returns(uint n) { return 3; }
}

