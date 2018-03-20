contract Test {
	string s;
	bytes b;
	function f(string _s, uint n) returns (byte) {
		b = bytes(_s);
		s = string(b);
		return bytes(s)[n];
	}
	function l() returns (uint) { return bytes(s).length; }
}

