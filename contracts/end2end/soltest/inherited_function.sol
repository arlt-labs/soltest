contract A { function f() internal returns (uint) { return 1; } }
contract B is A {
	function f() internal returns (uint) { return 2; }
	function g() returns (uint) {
		return A.f();
	}
}

