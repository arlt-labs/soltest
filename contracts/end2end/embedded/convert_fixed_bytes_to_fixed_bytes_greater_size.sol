/// @ext:soltest
/// {convert_fixed_bytes_to_fixed_bytes_greater_size}
///     // compileAndRun(sourceCode);
///     // ABI_CHECK(callContractFunction("bytesToBytes(bytes2)", "ab"), encodeArgs("ab"));
contract Test {
	function bytesToBytes(bytes2 input) returns (bytes4 ret) {
		return bytes4(input);
	}
}

