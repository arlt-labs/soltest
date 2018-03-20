contract Test {
	function set(uint24[3][4] x) {
		x[2][2] = 1;
		x[3][2] = 7;
	}
	function f() returns (uint24[3][4]){
		uint24[3][4] memory data;
		set(data);
		return data;
	}
}

