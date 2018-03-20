contract test {
	function run() returns(uint256 y) {
		uint32 t = uint32(0xffffffff);
		uint32 x = t + 10;
		if (x >= 0xffffffff) return 0;
		return x;
	}
}

