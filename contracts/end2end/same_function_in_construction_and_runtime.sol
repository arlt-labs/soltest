contract C {
	uint public initial;
	function C() {
		initial = double(2);
	}
	function double(uint _arg) returns (uint _ret) {
		_ret = _arg * 2;
	}
	function runtime(uint _arg) returns (uint) {
		return double(_arg);
	}
}

