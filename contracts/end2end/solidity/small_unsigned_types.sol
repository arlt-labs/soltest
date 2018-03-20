contract test {
	function run() returns(uint256 y) {
		uint32 t = uint32(0xffffff);
		uint32 x = t * 0xffffff;
		return x / 0x100;
	}
}

