contract A {
	uint constant x = 7;
}
contract B is A {
	function f() returns (uint) {
		return A.x;
	}
}

