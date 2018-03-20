contract Base {
	uint public m_x;
	address[] m_s;
	function Base(uint x, address[] s) {
		m_x = x;
		m_s = s;
	}
	function part(uint i) returns (address) {
		return m_s[i];
	}
}
contract Main is Base {
	function Main(address[] s, uint x) Base(x, f(s)) {}
	function f(address[] s) returns (address[]) {
		return s;
	}
}
contract Creator {
	function f(uint x, address[] s) returns (uint r, address ch) {
		var c = new Main(s, x);
		r = c.m_x();
		ch = c.part(x);
	}
}

