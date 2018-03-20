/// @ext:soltest
/// {shift_right_uint8}
///     // compileAndRun(sourceCode, 0, "C");
///     // ABI_CHECK(callContractFunction("f(uint8,uint8)", u256(0x66), u256(0)), encodeArgs(u256(0x66)));
///     // ABI_CHECK(callContractFunction("f(uint8,uint8)", u256(0x66), u256(8)), encodeArgs(u256(0x0)));
contract C {
	function f(uint8 a, uint8 b) returns (uint) {
		return a >> b;
	}
}

