/// @ext:soltest
/// {pass_dynamic_arguments_to_the_base_base}
///     // compileAndRun(sourceCode);
///     // ABI_CHECK(callContractFunction("m_i()"), encodeArgs(4));
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

