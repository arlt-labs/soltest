/// @ext:soltest
/// {bytes_length_member}
///     // compileAndRun(sourceCode);
///     // ABI_CHECK(callContractFunction("getLength()"), encodeArgs(0));
///     // ABI_CHECK(callContractFunction("set()", 1, 2), encodeArgs(true));
///     // ABI_CHECK(callContractFunction("getLength()"), encodeArgs(4+32+32));
contract c {
	function set() returns (bool) { data = msg.data; return true; }
	function getLength() returns (uint) { return data.length; }
	bytes data;
}

