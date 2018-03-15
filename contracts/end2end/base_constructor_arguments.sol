contract BaseBase {
	uint m_a;
	function BaseBase(uint a) {
		m_a = a;
	}
}
contract Base is BaseBase(7) {
	function Base() {
		m_a *= m_a;
	}
}
contract Derived is Base() {
	function getA() returns (uint r) { return m_a; }
}

