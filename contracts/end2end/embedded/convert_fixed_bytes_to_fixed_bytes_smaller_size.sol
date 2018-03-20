/// @ext:soltest
/// {convert_fixed_bytes_to_fixed_bytes_smaller_size}
///     // compileAndRun(sourceCode);
///     // ABI_CHECK(callContractFunction("bytesToBytes(bytes4)", "abcd"), encodeArgs("ab"));
contract Test {
	function bytesToBytes(bytes4 input) returns (bytes2 ret) {
		return bytes2(input);
	}
}

