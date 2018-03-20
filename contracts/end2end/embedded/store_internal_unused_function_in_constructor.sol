/// @ext:soltest
/// {store_internal_unused_function_in_constructor}
///     //
///     // compileAndRun(sourceCode, 0, "C");
///     // ABI_CHECK(callContractFunction("t()"), encodeArgs(u256(7)));
contract C {
	function () internal returns (uint) x;
	function C () {
		x = unused;
	}
	function unused() internal returns (uint) {
		return 7;
	}
	function t() returns (uint) {
		return x();
	}
}

