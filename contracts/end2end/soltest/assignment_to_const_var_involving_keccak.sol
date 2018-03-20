contract C {
	bytes32 constant x = keccak256("abc");
	function f() returns (bytes32) { return x; }
}

