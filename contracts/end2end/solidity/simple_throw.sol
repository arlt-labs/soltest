contract Test {
	function f(uint x) returns (uint) {
		if (x > 10)
			return x + 10;
		else
			throw;
		return 2;
	}
}

