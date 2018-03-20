library L {
	function f() returns (uint) { return 7; }
}
contract C {
	function f() payable returns (uint) {
		return L.f();
	}
}

