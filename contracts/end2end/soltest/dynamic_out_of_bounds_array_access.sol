contract c {
	uint[] data;
	function enlarge(uint amount) returns (uint) { return data.length += amount; }
	function set(uint index, uint value) returns (bool) { data[index] = value; return true; }
	function get(uint index) returns (uint) { return data[index]; }
	function length() returns (uint) { return data.length; }
}

