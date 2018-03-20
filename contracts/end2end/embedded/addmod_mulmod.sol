/// @ext:soltest
/// {addmod_mulmod}
///     // compileAndRun(sourceCode);
///     // ABI_CHECK(callContractFunction("test()"), encodeArgs(u256(0)));
contract C {
	function test() returns (uint) {
		// Note that this only works because computation on literals is done using
		// unbounded integers.
		if ((2**255 + 2**255) % 7 != addmod(2**255, 2**255, 7))
			return 1;
		if ((2**255 + 2**255) % 7 != addmod(2**255, 2**255, 7))
			return 2;
		return 0;
	}
}

