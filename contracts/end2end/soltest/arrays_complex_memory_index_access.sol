contract Test {
	function set(uint24[3][] _data, uint a, uint b) returns (uint l, uint e) {
		l = _data.length;
		e = _data[a][b];
	}
}

