/// @ext:soltest
/// {shift_constant_left}
///     // compileAndRun(sourceCode, 0, "C");
///     // ABI_CHECK(callContractFunction("a()"), encodeArgs(u256(0x4200)));
contract C {
	uint public a = 0x42 << 8;
}

