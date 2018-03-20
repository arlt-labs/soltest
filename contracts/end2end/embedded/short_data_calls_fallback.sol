/// @ext:soltest
/// {short_data_calls_fallback}
///     // compileAndRun(sourceCode);
///     // // should call fallback
///     // sendMessage(asBytes("\xd8\x8e\x0b"), false, 0);
///     // ABI_CHECK(callContractFunction("x()"), encodeArgs(2));
///     // // should call function
///     // sendMessage(asBytes(string("\xd8\x8e\x0b") + string(1, 0)), false, 0);
///     // ABI_CHECK(callContractFunction("x()"), encodeArgs(3));
contract A {
	uint public x;
	// Signature is d88e0b00
	function fow() { x = 3; }
	function () { x = 2; }
}

