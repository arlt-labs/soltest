contract test {
	function f(uint n) returns(uint nfac) {
		nfac = 1;
		for (var i = 2; i <= n; i++)
			nfac *= i;
	}
}

