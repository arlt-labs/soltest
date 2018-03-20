/// @ext:soltest
/// {convert_fixed_bytes_to_uint_greater_size}
///     // compileAndRun(sourceCode);
///     // ABI_CHECK(
///     // 	callContractFunction("bytesToUint(bytes4)", string("abcd")),
///     // 	encodeArgs(u256("0x61626364"))
///     // );
contract Test {
	function bytesToUint(bytes4 s) returns (uint64 h) {
		return uint64(s);
	}
}

