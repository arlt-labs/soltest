contract test {
	function foo(uint256 a) returns (bytes4 value) {
		return msg.sig;
	}
}

