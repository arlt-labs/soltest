contract A {
	uint x = 7;
}
contract B {
	uint x = 9;
}
contract C is A, B {
	function a() returns (uint) {
		return A.x;
	}
	function b() returns (uint) {
		return B.x;
	}
	function a_set(uint _x) returns (uint) {
		A.x = _x;
		return 1;
	}
	function b_set(uint _x) returns (uint) {
		B.x = _x;
		return 1;
	}
}

