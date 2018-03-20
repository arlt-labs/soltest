/// @ext:soltest
/// {value_complex}
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
	function sendAmount(uint amount) payable returns (uint256 bal) {
		var x1 = h.getBalance.value(amount);
		uint someStackElement = 20;
		var x2 = x1.gas(1000);
		return x2.value(amount + 3)();// overwrite value
	}
}

