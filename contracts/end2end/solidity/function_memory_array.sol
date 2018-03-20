contract C {
	function a(uint x) returns (uint) { return x + 1; }
	function b(uint x) returns (uint) { return x + 2; }
	function c(uint x) returns (uint) { return x + 3; }
	function d(uint x) returns (uint) { return x + 5; }
	function e(uint x) returns (uint) { return x + 8; }
	function test(uint x, uint i) returns (uint) {
		function(uint) internal returns (uint)[] memory arr =
			new function(uint) internal returns (uint)[](10);
		arr[0] = a;
		arr[1] = b;
		arr[2] = c;
		arr[3] = d;
		arr[4] = e;
		return arr[i](x);
	}
}

