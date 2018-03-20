/// @ext:soltest
/// {value_insane}
///     // compileAndRun(sourceCode, 20);
///     // BOOST_REQUIRE(callContractFunction("sendAmount(uint256)", 5) == encodeArgs(8));
contract helper {
	function getBalance() payable returns (uint256 myBalance) {
		return this.balance;
	}
}
contract test {
	helper h;
	function test() payable { h = new helper(); }
	function sendAmount(uint amount) returns (uint256 bal) {
		var x1 = h.getBalance.value;
		var x2 = x1(amount).gas;
		var x3 = x2(1000).value;
		return x3(amount + 3)();// overwrite value
	}
}

