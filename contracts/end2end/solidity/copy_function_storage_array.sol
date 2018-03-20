contract C {
	function() internal returns (uint)[] x;
	function() internal returns (uint)[] y;
	function test() returns (uint) {
		x.length = 10;
		x[9] = a;
		y = x;
		return y[9]();
	}
	function a() returns (uint) {
		return 7;
	}
}

