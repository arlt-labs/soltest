contract C {
	function g() {}
	function f() returns (function() external) {
		return this.g;
	}
}

