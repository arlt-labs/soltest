/// @ext:soltest
/// {external_function_to_address}
///     //
///     // compileAndRun(sourceCode, 0, "C");
///     // ABI_CHECK(callContractFunction("f()"), encodeArgs(true));
///     // ABI_CHECK(callContractFunction("g(function)", fromHex("00000000000000000000000000000000000004226121ff00000000000000000")), encodeArgs(u160(0x42)));
contract C {
	function f() returns (bool) {
		return address(this.f) == address(this);
	}
	function g(function() external cb) returns (address) {
		return address(cb);
	}
}

