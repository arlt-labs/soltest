/// @ext:soltest
/// {calling_uninitialized_function}
///     //
///     // compileAndRun(sourceCode, 0, "C");
///     // // This should throw exceptions
///     // ABI_CHECK(callContractFunction("intern()"), encodeArgs());
///     // ABI_CHECK(callContractFunction("extern()"), encodeArgs());
contract C {
	function intern() returns (uint) {
		function (uint) internal returns (uint) x;
		x(2);
		return 7;
	}
	function extern() returns (uint) {
		function (uint) external returns (uint) x;
		x(2);
		return 7;
	}
}

