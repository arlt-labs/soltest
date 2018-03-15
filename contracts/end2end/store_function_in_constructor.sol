contract C {
	uint public result_in_constructor;
	function (uint) internal returns (uint) x;
	function C () {
		x = double;
		result_in_constructor = use(2);
	}
	function double(uint _arg) returns (uint _ret) {
		_ret = _arg * 2;
	}
	function use(uint _arg) returns (uint) {
		return x(_arg);
	}
}

