contract C {
	function f() returns (uint) {
		uint x = 1;
		(x) = 2;
		return x;
	}
}

