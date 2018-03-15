contract c {
	bytes8[4] data1; // fits into one slot
	bytes10[6] data2; // 4 elements need two slots
	function test() returns (bytes10 r1, bytes10 r2, bytes10 r3) {
		data1[0] = 1;
		data1[1] = 2;
		data1[2] = 3;
		data1[3] = 4;
		for (uint i = 0; i < data2.length; ++i)
			data2[i] = bytes10(0xffff00 | (1 + i));
		data2 = data1;
		r1 = data2[3];
		r2 = data2[4];
		r3 = data2[5];
	}
}

