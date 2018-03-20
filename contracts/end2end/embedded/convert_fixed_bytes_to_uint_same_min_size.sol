/// @ext:soltest
/// {convert_fixed_bytes_to_uint_same_min_size}
///     // compileAndRun(sourceCode);
///     // ABI_CHECK(
///     // 	callContractFunction("bytesToUint(bytes1)", string("a")),
///     // 	encodeArgs(u256("0x61"))
///     // );
contract Test {
	function bytesToUint(bytes1 s) returns (uint8 h) {
		return uint8(s);
	}
}

