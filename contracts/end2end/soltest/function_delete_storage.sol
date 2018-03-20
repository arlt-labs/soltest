contract C {
	function a() returns (uint) { return 7; }
	function() internal returns (uint) y;
	function set() returns (uint) {
		y = a;
		return y();
	}
	function d() returns (uint) {
		delete y;
		return 1;
	}
	function ca() returns (uint) {
		return y();
	}
}

