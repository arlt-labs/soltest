/// @ext:soltest
/// {convert_fixed_bytes_to_uint_smaller_size}
///     // compileAndRun(sourceCode);
///     // ABI_CHECK(
///     // 	callContractFunction("bytesToUint(bytes4)", string("abcd")),
///     // 	encodeArgs(u256("0x6364"))
///     // );
contract Test {
	function bytesToUint(bytes4 s) returns (uint16 h) {
		return uint16(s);
	}
}

