contract helper {
	function() payable { } // can receive ether
}
contract test {
	helper h;
	function test() payable { h = new helper(); h.send(5); }
	function getBalance() returns (uint256 myBalance, uint256 helperBalance) {
		myBalance = this.balance;
		helperBalance = h.balance;
	}
}

