contract test {
	mapping(uint => uint) data;
	function test() {
		data[7] = 8;
	}
	function get(uint key) returns (uint value) {
		return data[key];
	}
}

