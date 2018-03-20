contract Test {
	function set(bytes _data, uint i) returns (uint l, byte c) {
		l = _data.length;
		c = _data[i];
	}
}

