/// @ext:soltest
/// {shift_bytes_cleanup}
///     // compileAndRun(sourceCode, 0, "C");
///     // ABI_CHECK(callContractFunction("left(uint8)", 8 * 8), encodeArgs("901234567890" + string(8, 0)));
///     // ABI_CHECK(callContractFunction("right(uint8)", 8 * 8), encodeArgs(string(8, 0) + "123456789012"));
contract C {
	function left(uint8 y) returns (bytes20) {
		bytes20 x;
		assembly { x := "12345678901234567890abcde" }
		return x << y;
	}
	function right(uint8 y) returns (bytes20) {
		bytes20 x;
		assembly { x := "12345678901234567890abcde" }
		return x >> y;
	}
}

