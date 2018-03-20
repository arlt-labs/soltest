/// @ext:soltest
/// {pass_dynamic_arguments_to_the_base}
///     // compileAndRun(sourceCode);
///     // ABI_CHECK(callContractFunction("m_i()"), encodeArgs(4));
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

