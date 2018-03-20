/// @ext:soltest
/// {return_string}
///     // compileAndRun(sourceCode, 0, "Main");
///     // string s("Julia");
///     // bytes args = encodeArgs(u256(0x20), u256(s.length()), s);
///     // BOOST_REQUIRE(callContractFunction("set(string)", asString(args)) == encodeArgs());
///     // ABI_CHECK(callContractFunction("get1()"), args);
///     // ABI_CHECK(callContractFunction("get2()"), args);
///     // ABI_CHECK(callContractFunction("s()"), args);
contract Main {
	string public s;
	function set(string _s) external {
		s = _s;
	}
	function get1() returns (string r) {
		return s;
	}
	function get2() returns (string r) {
		r = s;
	}
}

