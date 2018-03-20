contract Test {
	mapping(string => uint) data;
	function f() returns (uint) {
		data["abc"] = 2;
		return data["abc"];
	}
}

