/// @ext:soltest
/// {pass_dynamic_arguments_to_the_base_base_with_gap}
///     // compileAndRun(sourceCode);
///     // ABI_CHECK(callContractFunction("m_i()"), encodeArgs(4));
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

