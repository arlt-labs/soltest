contract Base {
	function Base(uint j)
	{
		m_i = j;
	}
	uint public m_i;
}
contract Base1 is Base(3) {
	function Base1(uint k) Base(k*k) {}
}
contract Derived is Base(3), Base1(2) {
	function Derived(uint i) Base(i) Base1(i)
	{}
}
contract Final is Derived(4) {

}
