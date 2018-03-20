/// @ext:soltest
/// {failing_ecrecover_invalid_input}
///     // compileAndRun(sourceCode, 0, "C");
///     // ABI_CHECK(callContractFunction("f()"), encodeArgs(u256(0)));
contract C {
	function f() returns (address) {
		return ecrecover(bytes32(uint(-1)), 1, 2, 3);
	}
}

