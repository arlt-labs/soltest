contract C {
	function gasleft() returns(uint256) { return 0; }
	function f() returns(uint256) { return gasleft(); }
}

