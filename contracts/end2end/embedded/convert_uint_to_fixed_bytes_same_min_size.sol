/// @ext:soltest
/// {convert_uint_to_fixed_bytes_same_min_size}
///     // compileAndRun(sourceCode);
///     // ABI_CHECK(
///     // 	callContractFunction("UintToBytes(uint8)", u256("0x61")),
///     // 	encodeArgs(string("a"))
///     // );
contract Test {
	function UintToBytes(uint8 h) returns (bytes1 s) {
		return bytes1(h);
	}
}

