contract Main {
	string public s1;
	string public s2;
	function set(string _s1, uint x, string _s2) external returns (uint) {
		s1 = _s1;
		s2 = _s2;
		return x;
	}
	function get() returns (string r1, string r2) {
		r1 = s1;
		r2 = s2;
	}
}

