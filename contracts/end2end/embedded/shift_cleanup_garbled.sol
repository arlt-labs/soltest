/// @ext:soltest
/// {shift_cleanup_garbled}
///     // compileAndRun(sourceCode, 0, "C");
///     // ABI_CHECK(callContractFunction("f()"), encodeArgs(u256(0x0)));
contract C {
	function f() returns (uint8 x) {
		assembly {
			x := 0xffff
		}
		x >>= 8;
	}
}

