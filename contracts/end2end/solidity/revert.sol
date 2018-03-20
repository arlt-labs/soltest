contract C {
	uint public a = 42;
	function f() {
		a = 1;
		revert();
	}
	function g() {
		a = 1;
		assembly {
			revert(0, 0)
		}
	}
}

