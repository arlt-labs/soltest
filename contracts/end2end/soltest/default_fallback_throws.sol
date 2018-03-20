contract A {
	function f() returns (bool) {
		return this.call();
	}
}

