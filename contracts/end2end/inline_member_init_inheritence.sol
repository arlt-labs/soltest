contract Base {
	function Base(){}
	uint m_base = 5;
	function getBMember() returns (uint i) { return m_base; }
}
contract Derived is Base {
	function Derived(){}
	uint m_derived = 6;
	function getDMember() returns (uint i) { return m_derived; }

}
