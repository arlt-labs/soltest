contract C {
	function f() returns (uint16 x) {
		x = 0xffff;
		x += 32;
		x <<= 8;
		x >>= 16;
	}
}

