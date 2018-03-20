contract C {
	function f() returns (uint8 x) {
		assembly {
			x := 0xffff
		}
		x >>= 8;
	}
}

