library L {
	struct S { uint[] data; }
	function f(S _s) internal returns (uint[]) {
		_s.data[3] = 2;
		return _s.data;
	}
}
contract C {
	using L for L.S;
	function f() returns (uint) {
		L.S memory x;
		x.data = new uint[](7);
		x.data[3] = 8;
		return x.f()[3];
	}
}

