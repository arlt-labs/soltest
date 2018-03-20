contract C {
	function f(uint a, uint b) returns (uint) {
		a <<= b;
		return a;
	}
}

