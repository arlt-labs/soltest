contract c {
	function set() returns (bool) { data = msg.data; return true; }
	function() { data = msg.data; }
	bytes data;
}

