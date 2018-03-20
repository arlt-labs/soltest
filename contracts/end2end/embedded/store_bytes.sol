/// @ext:soltest
/// {store_bytes}
///     // compileAndRun(sourceCode);
///     // // empty copy loop
///     // ABI_CHECK(callContractFunction("save()"), encodeArgs(24));
///     // ABI_CHECK(callContractFunction("save()", "abcdefg"), encodeArgs(24));
contract C {
	function save() returns (uint r) {
		r = 23;
		savedData = msg.data;
		r = 24;
	}
	bytes savedData;
}

