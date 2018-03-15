contract C {
	function f() returns (bytes x) {
		x = "12345";
		x[3] = 0x61;
		x[0] = 0x62;
	}
}

