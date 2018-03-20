contract test {
	function test() payable {}
	function a(address addr, uint amount) returns (uint ret) {
		addr.send(amount);
		return address(this).balance;
	}
}

