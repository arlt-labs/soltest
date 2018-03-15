contract C {
	function a() returns (uint) { return 7; }
	function test() returns (uint) {
		var y = a;
		delete y;
		y();
	}
}

