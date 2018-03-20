contract A {
	event x();
}
contract B is A {
	function f() returns (uint) {
		A.x();
		return 1;
	}
}

