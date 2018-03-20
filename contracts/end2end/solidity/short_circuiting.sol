contract test {
	function run(uint x) returns(uint y) {
		x == 0 || ((x = 8) > 0);
		return x;
	}
}

