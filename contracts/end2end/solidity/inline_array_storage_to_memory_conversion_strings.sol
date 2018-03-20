contract C {
	string s = "doh";
	function f() returns (string, string) {
		string memory t = "ray";
		string[3] memory x = [s, t, "mi"];
		return (x[1], x[2]);
	}
}

