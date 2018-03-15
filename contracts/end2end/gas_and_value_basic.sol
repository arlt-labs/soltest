contract helper {
	bool flag;
	function getBalance() payable returns (uint256 myBalance) {
		return this.balance;
	}
	function setFlag() { flag = true; }
	function getFlag() returns (bool fl) { return flag; }
}
contract test {
	helper h;
	function test() payable { h = new helper(); }
	function sendAmount(uint amount) payable returns (uint256 bal) {
		return h.getBalance.value(amount)();
	}
	function outOfGas() returns (bool ret) {
		h.setFlag.gas(2)(); // should fail due to OOG
		return true;
	}
	function checkState() returns (bool flagAfter, uint myBal) {
		flagAfter = h.getFlag();
		myBal = this.balance;
	}
}

