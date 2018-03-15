contract test {
	function run(uint x1, uint x2, uint x3) returns(uint y) {
		var a = 0x1; var b = 0x10; var c = 0x100;
		y = a + b + c + x1 + x2 + x3;
		y += b + x2;
	}
}

