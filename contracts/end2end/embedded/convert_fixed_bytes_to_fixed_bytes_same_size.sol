/// @ext:soltest
/// {convert_fixed_bytes_to_fixed_bytes_same_size}
///     // compileAndRun(sourceCode);
///     // ABI_CHECK(callContractFunction("bytesToBytes(bytes4)", "abcd"), encodeArgs("abcd"));
contract Test {
	function bytesToBytes(bytes4 input) returns (bytes4 ret) {
		return bytes4(input);
	}
}

