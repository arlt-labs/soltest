contract C {
	function test() returns (uint, uint) {
		uint32 a = 0xffffffff;
		uint16 x = uint16(a);
		uint16 y = x;
		x /= 0x100;
		y = y / 0x100;
		return (x, y);
	}
}

