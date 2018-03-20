/// @ext:soltest
/// {constant_string_literal}
///     //
///     // compileAndRun(sourceCode);
///     // string longStr = "abefghijklmnopqabcdefghijklmnopqabcdefghijklmnopqabca";
///     // string shortStr = "abcdefghijklmnopq";
///     // ABI_CHECK(callContractFunction("b()"), encodeArgs(shortStr));
///     // ABI_CHECK(callContractFunction("x()"), encodeDyn(longStr));
///     // ABI_CHECK(callContractFunction("getB()"), encodeArgs(shortStr));
///     // ABI_CHECK(callContractFunction("getX()"), encodeDyn(longStr));
///     // ABI_CHECK(callContractFunction("getX2()"), encodeDyn(longStr));
///     // ABI_CHECK(callContractFunction("unused()"), encodeArgs(2));
contract Test {
	bytes32 constant public b = "abcdefghijklmnopq";
	string constant public x = "abefghijklmnopqabcdefghijklmnopqabcdefghijklmnopqabca";

	function Test() {
		var xx = x;
		var bb = b;
	}
	function getB() returns (bytes32) { return b; }
	function getX() returns (string) { return x; }
	function getX2() returns (string r) { r = x; }
	function unused() returns (uint) {
		"unusedunusedunusedunusedunusedunusedunusedunusedunusedunusedunusedunused";
		return 2;
	}
}

