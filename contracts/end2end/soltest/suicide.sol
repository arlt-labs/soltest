contract test {
	function test() payable {}
	function a(address receiver) returns (uint ret) {
		suicide(receiver);
		return 10;
	}
}

