contract c {
	uint[20] spacer;
	uint[] dynamic;
	function fill() {
		dynamic.length = 21;
		for (uint i = 0; i < dynamic.length; ++i) dynamic[i] = i+1;
	}
	function halfClear() { dynamic.length = 5; }
	function fullClear() { delete dynamic; }
}

