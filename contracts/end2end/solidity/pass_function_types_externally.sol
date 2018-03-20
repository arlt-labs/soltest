contract C {
	function f(uint x) returns (uint) {
		return this.eval(this.g, x);
	}
	function f2(uint x) returns (uint) {
		return eval(this.g, x);
	}
	function eval(function(uint) external returns (uint) x, uint a) returns (uint) {
		return x(a);
	}
	function g(uint x) returns (uint) { return x + 1; }
}

