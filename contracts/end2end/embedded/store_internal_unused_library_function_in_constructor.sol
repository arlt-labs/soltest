library L { function x() internal returns (uint) { return 7; } }
/// @ext:soltest
/// {store_internal_unused_library_function_in_constructor}
///     //
///     // compileAndRun(sourceCode, 0, "C");
///     // ABI_CHECK(callContractFunction("t()"), encodeArgs(u256(7)));
contract C {
	function () internal returns (uint) x;
	function C () {
		x = L.x;
	}
	function t() returns (uint) {
		return x();
	}
}

