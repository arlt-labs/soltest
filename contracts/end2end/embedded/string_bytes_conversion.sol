/// @ext:soltest
/// {string_bytes_conversion}
///     // compileAndRun(sourceCode, 0, "Test");
///     // ABI_CHECK(callContractFunction(
///     // 	"f(string,uint256)",
///     // 	u256(0x40),
///     // 	u256(2),
///     // 	u256(6),
///     // 	string("abcdef")
///     // ), encodeArgs("c"));
///     // ABI_CHECK(callContractFunction("l()"), encodeArgs(u256(6)));
contract Test {
	string s;
	bytes b;
	function f(string _s, uint n) returns (byte) {
		b = bytes(_s);
		s = string(b);
		return bytes(s)[n];
	}
	function l() returns (uint) { return bytes(s).length; }
}

