/// @ext:soltest
/// {strings}
///     // compileAndRun(sourceCode);
///     // ABI_CHECK(callContractFunction("fixedBytes()"), encodeArgs(string("abc\0\xff__", 7)));
///     // ABI_CHECK(callContractFunction("pipeThrough(bytes2,bool)", string("\0\x02", 2), true), encodeArgs(string("\0\x2", 2), true));
contract test {
	function fixedBytes() returns(bytes32 ret) {
		return "abc\x00\xff__";
	}
	function pipeThrough(bytes2 small, bool one) returns(bytes16 large, bool oneRet) {
		oneRet = one;
		large = small;
	}
}

