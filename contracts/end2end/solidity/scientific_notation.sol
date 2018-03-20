contract C {
	function f() returns (uint) {
		return 2e10 wei;
	}
	function g() returns (uint) {
		return 200e-2 wei;
	}
	function h() returns (uint) {
		return 2.5e1;
	}
	function i() returns (int) {
		return -2e10;
	}
	function j() returns (int) {
		return -200e-2;
	}
	function k() returns (int) {
		return -2.5e1;
	}
}

