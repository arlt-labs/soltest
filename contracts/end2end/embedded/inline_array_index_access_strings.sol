/// @ext:soltest
/// {inline_array_index_access_strings}
///     // compileAndRun(sourceCode, 0, "C");
///     // ABI_CHECK(callContractFunction("test()"), encodeArgs());
///     // ABI_CHECK(callContractFunction("tester()"), encodeArgs(u256(0x20), u256(3), string("abc")));
contract C {
	string public tester;
	function f() returns (string) {
		return (["abc", "def", "g"][0]);
	}
	function test() {
		tester = f();
	}
}

