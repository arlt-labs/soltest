library L {
	function g(uint[] _data) private {
		_data[3] = 2;
	}
	function f(uint[] _data) internal {
		g(_data);
	}
}
contract C {
	function f() returns (uint) {
		uint[] memory x = new uint[](7);
		x[3] = 8;
		L.f(x);
		return x[3];
	}
}

