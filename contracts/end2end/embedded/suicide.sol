/// @ext:soltest
/// {suicide}
///     // u256 amount(130);
///     // compileAndRun(sourceCode, amount);
///     // u160 address(23);
///     // ABI_CHECK(callContractFunction("a(address)", address), bytes());
///     // BOOST_CHECK(!addressHasCode(m_contractAddress));
///     // BOOST_CHECK_EQUAL(balanceAt(address), amount);
contract test {
	function test() payable {}
	function a(address receiver) returns (uint ret) {
		suicide(receiver);
		return 10;
	}
}

