contract BaseBase {
	uint m_a;
	function BaseBase(uint a) {
		m_a = a;
	}
}
contract Base is BaseBase(2) { }
contract Derived is BaseBase(3), Base {
	function getA() returns (uint r) { return m_a; }
}

