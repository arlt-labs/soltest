/// @ext:soltest
/// {inline_member_init_inheritence}
///     // compileAndRun(sourceCode);
///     // ABI_CHECK(callContractFunction("getBMember()"), encodeArgs(5));
///     // ABI_CHECK(callContractFunction("getDMember()"), encodeArgs(6));
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

