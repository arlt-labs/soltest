contract test {
	function f(bool cond) returns (uint, uint) {
		return cond ? (1, 2) : (3, 4);
	}
}

