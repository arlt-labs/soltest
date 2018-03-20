/// @ext:soltest
/// {convert_uint_to_fixed_bytes_smaller_size}
///     // compileAndRun(sourceCode);
///     // ABI_CHECK(
///     // 	callContractFunction("uintToBytes(uint32)", u160("0x61626364")),
///     // 	encodeArgs(string("cd"))
///     // );
contract Test {
	function uintToBytes(uint32 h) returns (bytes2 s) {
		return bytes2(h);
	}
}

