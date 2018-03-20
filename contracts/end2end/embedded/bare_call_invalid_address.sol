/// @ext:soltest
/// {bare_call_invalid_address}
///     // compileAndRun(sourceCode, 0, "C");
///     // ABI_CHECK(callContractFunction("f()"), encodeArgs(u256(1)));
///     // ABI_CHECK(callContractFunction("g()"), encodeArgs(u256(1)));
///     // ABI_CHECK(callContractFunction("h()"), encodeArgs(u256(1)));
contract C {
	/// Calling into non-existant account is successful (creates the account)
	function f() external view returns (bool) {
		return address(0x4242).call();
	}
	function g() external view returns (bool) {
		return address(0x4242).callcode();
	}
	function h() external view returns (bool) {
		return address(0x4242).delegatecall();
	}
}

