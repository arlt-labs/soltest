contract test {
	function f(uint x) returns(uint d) {
		return x > 100 ?
					x > 1000 ? 1000 : 100
					:
					x > 50 ? 50 : 10;
	}
}

