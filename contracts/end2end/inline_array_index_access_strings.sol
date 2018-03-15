contract C {
	string public tester;
	function f() returns (string) {
		return (["abc", "def", "g"][0]);
	}
	function test() {
		tester = f();
	}
}

