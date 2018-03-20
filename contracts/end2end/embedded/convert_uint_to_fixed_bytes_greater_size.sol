/// @ext:soltest
/// {convert_uint_to_fixed_bytes_greater_size}
///     // compileAndRun(sourceCode);
///     // ABI_CHECK(
///     // 	callContractFunction("UintToBytes(uint16)", u256("0x6162")),
///     // 	encodeArgs(string("\0\0\0\0\0\0ab", 8))
///     // );
contract Test {
	function UintToBytes(uint16 h) returns (bytes8 s) {
		return bytes8(h);
	}
}

