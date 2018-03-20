contract C {
	function f() returns (uint a) {
		a = 0x4200;
		a >>= 8;
	}
}

