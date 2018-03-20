contract A {
	event x();
}
contract B is A {
	function f() returns (uint) {
		emit A.x();
		return 1;
	}
}

