contract C {
	function f() returns (int8) {
		uint8 x = 254;
		int8 y = 1;
		return y << x;
	}
}

