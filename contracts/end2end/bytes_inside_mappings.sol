contract c {
	function set(uint key) returns (bool) { data[key] = msg.data; return true; }
	function copy(uint from, uint to) returns (bool) { data[to] = data[from]; return true; }
	mapping(uint => bytes) data;
}

