contract test {
	function test() payable {}
	function a(address receiver) returns (uint ret) {
		selfdestruct(receiver);
		return 10;
	}
}

