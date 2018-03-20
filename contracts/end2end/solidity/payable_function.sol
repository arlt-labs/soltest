contract C {
	uint public a;
	function f() payable returns (uint) {
		return msg.value;
	}
	function() payable {
		a = msg.value + 1;
	}
}

