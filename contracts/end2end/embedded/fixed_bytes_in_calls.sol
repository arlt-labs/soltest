/// @ext:soltest
/// {fixed_bytes_in_calls}
///     // compileAndRun(sourceCode, 0, "Helper");
///     // u160 const c_helperAddress = m_contractAddress;
///     // compileAndRun(sourceCode, 0, "Main");
///     // BOOST_REQUIRE(callContractFunction("setHelper(address)", c_helperAddress) == bytes());
///     // BOOST_REQUIRE(callContractFunction("getHelper()", c_helperAddress) == encodeArgs(c_helperAddress));
///     // ABI_CHECK(callContractFunction("callHelper(bytes2,bool)", string("\0a", 2), true), encodeArgs(string("\0a\0\0\0", 5)));
contract Helper {
	function invoke(bytes3 x, bool stop) returns (bytes4 ret) {
		return x;
	}
}
contract Main {
	Helper h;
	function callHelper(bytes2 x, bool stop) returns (bytes5 ret) {
		return h.invoke(x, stop);
	}
	function getHelper() returns (address addr) {
		return address(h);
	}
	function setHelper(address addr) {
		h = Helper(addr);
	}
}

