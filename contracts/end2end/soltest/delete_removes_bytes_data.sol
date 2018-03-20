contract c {
	function() { data = msg.data; }
	function del() returns (bool) { delete data; return true; }
	bytes data;
}

