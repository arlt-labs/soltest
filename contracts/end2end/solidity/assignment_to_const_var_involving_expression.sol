contract C {
	uint constant x = 0x123 + 0x456;
	function f() returns (uint) { return x + 1; }
}

