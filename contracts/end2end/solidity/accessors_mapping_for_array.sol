contract test {
	mapping(uint => uint[8]) public data;
	mapping(uint => uint[]) public dynamicData;
	function test() {
		data[2][2] = 8;
		dynamicData[2].length = 3;
		dynamicData[2][2] = 8;
	}
}

