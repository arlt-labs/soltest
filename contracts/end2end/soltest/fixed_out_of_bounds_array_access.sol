contract c {
	uint[4] data;
	function set(uint index, uint value) returns (bool) { data[index] = value; return true; }
	function get(uint index) returns (uint) { return data[index]; }
	function length() returns (uint) { return data.length; }
}

