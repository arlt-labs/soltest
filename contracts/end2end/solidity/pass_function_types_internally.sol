contract C {
	function f(uint x) returns (uint) {
		return eval(g, x);
	}
	function eval(function(uint) returns (uint) x, uint a) internal returns (uint) {
		return x(a);
	}
	function g(uint x) returns (uint) { return x + 1; }
}

