contract D {
	function f(function() external returns (function() external returns (uint))[] x)
		returns (function() external returns (uint)[3] r)
	{
		r[0] = x[0]();
		r[1] = x[1]();
		r[2] = x[2]();
	}
}
contract C {
	function test() returns (uint, uint, uint) {
		function() external returns (function() external returns (uint))[] memory x =
			new function() external returns (function() external returns (uint))[](10);
		for (uint i = 0; i < x.length; i ++)
			x[i] = this.h;
		x[0] = this.htwo;
		var y = (new D()).f(x);
		return (y[0](), y[1](), y[2]());
	}
	function e() returns (uint) { return 5; }
	function f() returns (uint) { return 6; }
	function g() returns (uint) { return 7; }
	uint counter;
	function h() returns (function() external returns (uint)) {
		return counter++ == 0 ? this.f : this.g;
	}
	function htwo() returns (function() external returns (uint)) {
		return this.e;
	}
}

