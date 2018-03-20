contract test {
	function f(bool cond, uint v) returns (uint a, uint b) {
		cond ? a = v : b = v;
	}
}

