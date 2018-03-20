contract Base {
	function Base(uint i)
	{
		m_i = i;
	}
	uint public m_i;
}
contract Base1 is Base(3) {}
contract Derived is Base(2), Base1 {
	function Derived(uint i) Base(i) {}
}
contract Final is Derived(4) {
}

