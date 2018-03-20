library L { function x() internal returns (uint) { return 7; } }
contract C {
	function () internal returns (uint) x;
	function C () {
		x = L.x;
	}
	function t() returns (uint) {
		return x();
	}
}

