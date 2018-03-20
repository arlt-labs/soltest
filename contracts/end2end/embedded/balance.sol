/// @ext:soltest
/// {balance}
///     // compileAndRun(sourceCode, 23);
///     // ABI_CHECK(callContractFunction("getBalance()"), encodeArgs(23));
contract test {
	function test() payable {}
	function getBalance() returns (uint256 balance) {
		return address(this).balance;
	}
}

