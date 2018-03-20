contract Main {
	bytes s1;
	function doSet(bytes _s1) returns (bytes _r1) {
		s1 = _s1;
		_r1 = s1;
	}
	function set(bytes _s1) external returns (uint _r, bytes _r1) {
		_r1 = doSet(_s1);
		_r = _r1.length;
	}
}

