contract C {
	function (uint) internal returns (uint) x;
	function C() {
		x = double;
	}
	function test() returns (bool) {
		return x == double;
	}
	function double(uint _arg) returns (uint _ret) {
		_ret = _arg * 2;
	}
}

