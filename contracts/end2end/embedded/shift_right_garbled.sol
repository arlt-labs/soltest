/// @ext:soltest
/// {shift_right_garbled}
///     // compileAndRun(sourceCode, 0, "C");
///     // ABI_CHECK(callContractFunction("f(uint8,uint8)", u256(0x0), u256(4)), encodeArgs(u256(0xf)));
///     // ABI_CHECK(callContractFunction("f(uint8,uint8)", u256(0x0), u256(0x1004)), encodeArgs(u256(0xf)));
contract C {
	function f(uint8 a, uint8 b) returns (uint) {
		assembly {
			a := 0xffffffff
		}
		// Higher bits should be cleared before the shift
		return a >> b;
	}
}

