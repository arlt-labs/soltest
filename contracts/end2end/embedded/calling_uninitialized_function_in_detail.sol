/// @ext:soltest
/// {calling_uninitialized_function_in_detail}
///     //
///     // compileAndRun(sourceCode, 0, "C");
///     // ABI_CHECK(callContractFunction("t()"), encodeArgs());
contract C {
	function() internal returns (uint) x;
	int mutex;
	function t() returns (uint) {
		if (mutex > 0)
			return 7;
		mutex = 1;
		// Avoid re-executing this function if we jump somewhere.
		x();
		return 2;
	}
}

