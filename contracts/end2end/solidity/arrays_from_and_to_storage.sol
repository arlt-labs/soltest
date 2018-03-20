contract Test {
	uint24[] public data;
	function set(uint24[] _data) returns (uint) {
		data = _data;
		return data.length;
	}
	function get() returns (uint24[]) {
		return data;
	}
}

