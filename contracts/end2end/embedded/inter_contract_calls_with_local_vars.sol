/// @ext:soltest
/// {inter_contract_calls_with_local_vars}
///     // compileAndRun(sourceCode, 0, "Helper");
///     // u160 const c_helperAddress = m_contractAddress;
///     // compileAndRun(sourceCode, 0, "Main");
///     // BOOST_REQUIRE(callContractFunction("setHelper(address)", c_helperAddress) == bytes());
///     // BOOST_REQUIRE(callContractFunction("getHelper()", c_helperAddress) == encodeArgs(c_helperAddress));
///     // u256 a(3456789);
///     // u256 b("0x282837623374623234aa74");
///     // BOOST_REQUIRE(callContractFunction("callHelper(uint256,uint256)", a, b) == encodeArgs(a * b + 9));
contract Helper {
	function multiply(uint a, uint b) returns (uint c) {
		return a * b;
	}
}
contract Main {
	Helper h;
	function callHelper(uint a, uint b) returns (uint c) {
		var fu = h.multiply;
		var y = 9;
		var ret = fu(a, b);
		return ret + y;
	}
	function getHelper() returns (address haddress) {
		return address(h);
	}
	function setHelper(address haddress) {
		h = Helper(haddress);
	}
}

