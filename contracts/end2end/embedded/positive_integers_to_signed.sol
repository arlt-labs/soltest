/// @ext:soltest
/// {positive_integers_to_signed}
///     // compileAndRun(sourceCode, 0, "test");
///     // ABI_CHECK(callContractFunction("x()"), encodeArgs(2));
///     // ABI_CHECK(callContractFunction("y()"), encodeArgs(127));
///     // ABI_CHECK(callContractFunction("q()"), encodeArgs(250));
contract test {
	int8 public x = 2;
	int8 public y = 127;
	int16 public q = 250;
}

