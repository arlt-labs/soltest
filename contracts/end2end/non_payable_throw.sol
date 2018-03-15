contract C {
	uint public a;
	function f() returns (uint) {
		return msg.value;
	}
	function() {
		a = msg.value + 1;
	}
}

