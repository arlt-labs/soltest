contract test {
	function boo() returns (bytes4 value) {
		return msg.sig;
	}
	function foo(uint256 a) returns (bytes4 value) {
		return boo();
	}
}

