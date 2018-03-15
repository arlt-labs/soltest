contract test {
	function x() returns (uint) { return 1; }
	function y() returns (uint) { return 2; }

	function f(bool cond) returns (uint) {
		var z = cond ? x : y;
		return z();
	}
}

