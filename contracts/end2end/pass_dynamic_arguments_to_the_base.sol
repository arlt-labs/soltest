contract Base {
	function Base(uint i)
	{
		m_i = i;
	}
	uint public m_i;
}
contract Derived is Base(2) {
	function Derived(uint i) Base(i)
	{}
}
contract Final is Derived(4) {

}
