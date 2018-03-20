contract C {
	function g() returns (uint) { return 7; }
	function f(function() external returns (uint) g) returns (uint) {
		return g();
	}
}

