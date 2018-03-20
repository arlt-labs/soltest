pragma experimental ABIEncoderV2;
contract c {
	uint8[] x;
	uint16[] y;
	uint24[] z;
	uint24[][] w;
	function test1() returns (uint8[]) {
		for (uint i = 0; i < 101; ++i)
			x.push(uint8(i));
		return x;
	}
	function test2() returns (uint16[]) {
		for (uint i = 0; i < 101; ++i)
			y.push(uint16(i));
		return y;
	}
	function test3() returns (uint24[]) {
		for (uint i = 0; i < 101; ++i)
			z.push(uint24(i));
		return z;
	}
	function test4() returns (uint24[][]) {
		w.length = 5;
		for (uint i = 0; i < 5; ++i)
			for (uint j = 0; j < 101; ++j)
				w[i].push(uint24(j));
		return w;
	}
}

