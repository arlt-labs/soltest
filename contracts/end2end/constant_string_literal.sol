contract Test {
	bytes32 constant public b = "abcdefghijklmnopq";
	string constant public x = "abefghijklmnopqabcdefghijklmnopqabcdefghijklmnopqabca";

	function Test() {
		var xx = x;
		var bb = b;
	}
	function getB() returns (bytes32) { return b; }
	function getX() returns (string) { return x; }
	function getX2() returns (string r) { r = x; }
	function unused() returns (uint) {
		"unusedunusedunusedunusedunusedunusedunusedunusedunusedunusedunusedunused";
		return 2;
	}
}

