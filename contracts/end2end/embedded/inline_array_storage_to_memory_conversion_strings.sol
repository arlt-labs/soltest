/// @ext:soltest
/// {inline_array_storage_to_memory_conversion_strings}
///     // compileAndRun(sourceCode);
///     // ABI_CHECK(callContractFunction("f()"), encodeArgs(u256(0x40), u256(0x80), u256(3), string("ray"), u256(2), string("mi")));
contract C {
	string s = "doh";
	function f() returns (string, string) {
		string memory t = "ray";
		string[3] memory x = [s, t, "mi"];
		return (x[1], x[2]);
	}
}

