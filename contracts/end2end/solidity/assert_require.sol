contract C {
	function f() {
		assert(false);
	}
	function g(bool val) returns (bool) {
		assert(val == true);
		return true;
	}
	function h(bool val) returns (bool) {
		require(val);
		return true;
	}
}

