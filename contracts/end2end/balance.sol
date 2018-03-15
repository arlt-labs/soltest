contract test {
	function test() payable {}
	function getBalance() returns (uint256 balance) {
		return address(this).balance;
	}
}

