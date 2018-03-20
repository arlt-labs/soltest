contract C {
	function () internal returns (uint) x;
	function C () {
		x = unused;
	}
	function unused() internal returns (uint) {
		return 7;
	}
	function t() returns (uint) {
		return x();
	}
}

