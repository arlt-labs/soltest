contract A {
	uint x = 1;
	uint y = 2;
	function a() returns (uint x) {
		x = A.y;
	}
}

