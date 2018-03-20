contract C {
	function f() returns (uint, uint[], uint) {
		return (7, new uint[](2), 8);
	}
	function g() returns (uint, uint) {
		// Previous implementation "moved" b to the second place and did not skip.
		var (a, _, b) = this.f();
		return (a, b);
	}
}

