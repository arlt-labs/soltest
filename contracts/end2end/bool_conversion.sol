contract C {
	function f(bool _b) returns(uint) {
		if (_b)
			return 1;
		else
			return 0;
	}
	function g(bool _in) returns (bool _out) {
		_out = _in;
	}
}

