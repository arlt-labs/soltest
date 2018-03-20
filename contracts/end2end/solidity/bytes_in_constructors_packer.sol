contract Base {
	uint public m_x;
	bytes m_s;
	function Base(uint x, bytes s) {
		m_x = x;
		m_s = s;
	}
	function part(uint i) returns (byte) {
		return m_s[i];
	}
}
contract Main is Base {
	function Main(bytes s, uint x) Base(x, f(s)) {}
	function f(bytes s) returns (bytes) {
		return s;
	}
}
contract Creator {
	function f(uint x, bytes s) returns (uint r, byte ch) {
		var c = new Main(s, x);
		r = c.m_x();
		ch = c.part(x);
	}
}

