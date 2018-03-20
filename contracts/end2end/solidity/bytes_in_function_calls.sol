contract Main {
	string public s1;
	string public s2;
	function set(string _s1, uint x, string _s2) returns (uint) {
		s1 = _s1;
		s2 = _s2;
		return x;
	}
	function setIndirectFromMemory(string _s1, uint x, string _s2) returns (uint) {
		return this.set(_s1, x, _s2);
	}
	function setIndirectFromCalldata(string _s1, uint x, string _s2) external returns (uint) {
		return this.set(_s1, x, _s2);
	}
}

