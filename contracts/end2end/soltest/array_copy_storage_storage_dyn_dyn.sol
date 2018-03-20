contract c {
	uint[] data1;
	uint[] data2;
	function setData1(uint length, uint index, uint value) {
		data1.length = length; if (index < length) data1[index] = value;
	}
	function copyStorageStorage() { data2 = data1; }
	function getData2(uint index) returns (uint len, uint val) {
		len = data2.length; if (index < len) val = data2[index];
	}
}

