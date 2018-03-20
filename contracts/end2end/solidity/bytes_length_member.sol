contract c {
	function set() returns (bool) { data = msg.data; return true; }
	function getLength() returns (uint) { return data.length; }
	bytes data;
}

