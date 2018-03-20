contract C {
	function f(bytes2 a, uint16 x) returns (uint) {
		if (a != "ab") return 1;
		if (x != 0x0102) return 2;
		if (bytes3(x) != 0x0102) return 3;
		return 0;
	}
}

