contract C {
	function f() returns (uint a) {
		a = 0x42;
		a <<= 8;
	}
}

