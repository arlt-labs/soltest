contract test {
	function f() returns(uint ret) {
		ret = 1;
		for (;;) {
			ret += 1;
			if (ret >= 10) break;
		}
	}
}

