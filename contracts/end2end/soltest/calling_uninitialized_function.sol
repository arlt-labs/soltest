contract C {
	function intern() returns (uint) {
		function (uint) internal returns (uint) x;
		x(2);
		return 7;
	}
	function extern() returns (uint) {
		function (uint) external returns (uint) x;
		x(2);
		return 7;
	}
}

