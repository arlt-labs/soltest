/// @ext:soltest
/// {inline_array_strings_from_document}
///     // compileAndRun(sourceCode);
///     // ABI_CHECK(callContractFunction("f(uint256)", u256(0)), encodeArgs(u256(0x20), u256(4), string("This")));
///     // ABI_CHECK(callContractFunction("f(uint256)", u256(1)), encodeArgs(u256(0x20), u256(2), string("is")));
///     // ABI_CHECK(callContractFunction("f(uint256)", u256(2)), encodeArgs(u256(0x20), u256(2), string("an")));
///     // ABI_CHECK(callContractFunction("f(uint256)", u256(3)), encodeArgs(u256(0x20), u256(5), string("array")));
contract C {
	function f(uint i) returns (string) {
		string[4] memory x = ["This", "is", "an", "array"];
		return (x[i]);
	}
}

