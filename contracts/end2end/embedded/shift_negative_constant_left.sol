/// @ext:soltest
/// {shift_negative_constant_left}
///     // compileAndRun(sourceCode, 0, "C");
///     // ABI_CHECK(callContractFunction("a()"), encodeArgs(u256(-0x4200)));
contract C {
	int public a = -0x42 << 8;
}

