contract c {
	function set() returns (bool) { data1 = msg.data; return true; }
	function reset() returns (bool) { data1 = data2; return true; }
	bytes data1;
	bytes data2;
}

