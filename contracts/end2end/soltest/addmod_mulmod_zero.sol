contract C {
	function f() pure returns (uint) {
		addmod(1, 2, 0);
		return 2;
	}
	function g() pure returns (uint) {
		mulmod(1, 2, 0);
		return 2;
	}
	function h() pure returns (uint) {
		mulmod(0, 1, 2);
		mulmod(1, 0, 2);
		addmod(0, 1, 2);
		addmod(1, 0, 2);
		return 2;
	}
}

