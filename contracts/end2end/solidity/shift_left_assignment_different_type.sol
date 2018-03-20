contract C {
	function f(uint a, uint8 b) returns (uint) {
		a <<= b;
		return a;
	}
}

