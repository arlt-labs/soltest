/// @ext:soltest
/// {shift_bytes}
///     // compileAndRun(sourceCode, 0, "C");
///     // ABI_CHECK(callContractFunction("left(bytes20,uint8)", "12345678901234567890", 8 * 8), encodeArgs("901234567890" + string(8, 0)));
///     // ABI_CHECK(callContractFunction("right(bytes20,uint8)", "12345678901234567890", 8 * 8), encodeArgs(string(8, 0) + "123456789012"));
contract C {
	function left(bytes20 x, uint8 y) returns (bytes20) {
		return x << y;
	}
	function right(bytes20 x, uint8 y) returns (bytes20) {
		return x >> y;
	}
}

