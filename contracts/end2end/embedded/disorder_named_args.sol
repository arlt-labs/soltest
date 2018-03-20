/// @ext:soltest
/// {disorder_named_args}
///     // compileAndRun(sourceCode);
///     // ABI_CHECK(callContractFunction("b()", bytes()), toBigEndian(u256(123)));
contract test {
	function a(uint a, uint b, uint c) returns (uint r) { r = a * 100 + b * 10 + c * 1; }
	function b() returns (uint r) { r = a({c: 3, a: 1, b: 2}); }
}

