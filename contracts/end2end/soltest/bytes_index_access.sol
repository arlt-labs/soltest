contract c {
	bytes data;
	function direct(bytes arg, uint index) external returns (uint) {
		return uint(arg[index]);
	}
	function storageCopyRead(bytes arg, uint index) external returns (uint) {
		data = arg;
		return uint(data[index]);
	}
	function storageWrite() external returns (uint) {
		data.length = 35;
		data[31] = 0x77;
		data[32] = 0x14;

		data[31] = 1;
		data[31] |= 8;
		data[30] = 1;
		data[32] = 3;
		return uint(data[30]) * 0x100 | uint(data[31]) * 0x10 | uint(data[32]);
	}
}

