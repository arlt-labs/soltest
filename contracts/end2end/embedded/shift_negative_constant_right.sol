/// @ext:soltest
/// {shift_negative_constant_right}
///     // compileAndRun(sourceCode, 0, "C");
///     // ABI_CHECK(callContractFunction("a()"), encodeArgs(u256(-0x42)));
contract C {
	int public a = -0x4200 >> 8;
}

