contract Main {
	string public s;
	function set(string _s) external {
		s = _s;
	}
	function get1() returns (string r) {
		return s;
	}
	function get2() returns (string r) {
		r = s;
	}
}

