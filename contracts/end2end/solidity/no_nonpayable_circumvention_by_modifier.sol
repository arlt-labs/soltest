contract C {
	modifier tryCircumvent {
		if (false) _; // avoid the function, we should still not accept ether
	}
	function f() tryCircumvent returns (uint) {
		return msg.value;
	}
}

