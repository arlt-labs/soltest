contract test {
	function f(uint n) returns(uint nfac) {
		nfac = 1;
		var i = 2;
		while (i <= n) nfac *= i++;
	}
}

