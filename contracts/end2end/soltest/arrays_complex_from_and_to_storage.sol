contract Test {
	uint24[3][] public data;
	function set(uint24[3][] _data) returns (uint) {
		data = _data;
		return data.length;
	}
	function get() returns (uint24[3][]) {
		return data;
	}
}

