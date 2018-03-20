contract Other {
	function addTwo(uint x) returns (uint) { return x + 2; }
}
contract C {
	function (function (uint) external returns (uint)) returns (uint) ev;
	function (uint) external returns (uint) x;
	function store(function(uint) external returns (uint) y) {
		x = y;
	}
	function eval(function(uint) external returns (uint) y) returns (uint) {
		return y(7);
	}
	function t() returns (uint) {
		ev = eval;
		this.store((new Other()).addTwo);
		return ev(x);
	}
}

