contract c {
	uint spacer1;
	uint spacer2;
	uint[20] data;
	function fill() {
		for (uint i = 0; i < data.length; ++i) data[i] = i+1;
	}
	function clear() { delete data; }
}

