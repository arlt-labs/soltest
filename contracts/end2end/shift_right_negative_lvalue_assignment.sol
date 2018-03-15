contract C {
	function f(int a, int b) returns (int) {
		a >>= b;
		return a;
	}
}

