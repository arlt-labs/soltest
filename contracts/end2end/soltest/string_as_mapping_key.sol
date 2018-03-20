contract Test {
	mapping(string => uint) data;
	function set(string _s, uint _v) { data[_s] = _v; }
	function get(string _s) returns (uint) { return data[_s]; }
}

