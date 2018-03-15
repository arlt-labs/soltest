contract C {
	uint public x;
	modifier run() {
		for (uint i = 0; i < 10; i++) {
			_;
			break;
		}
	}
	function f() run {
		x++;
	}
}

