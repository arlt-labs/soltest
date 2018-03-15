contract test {
	function f() returns (bool) {
		bytes2 a = "a";
		bytes2 x = "aa";
		bytes2 b = "b";
		return a < x && x < b;
	}
}

