contract C {
	function f() returns (bytes32) {
		return keccak256("abc", msg.data);
	}
}

