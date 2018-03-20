/// @ext:soltest
/// {function_usage_in_constructor_arguments}
///     // compileAndRun(sourceCode, 0, "Derived");
///     // ABI_CHECK(callContractFunction("getA()"), encodeArgs(2));
contract BaseBase {
	uint m_a;
	function BaseBase(uint a) {
		m_a = a;
	}
	function g() returns (uint r) { return 2; }
}
contract Base is BaseBase(BaseBase.g()) {
}
contract Derived is Base() {
	function getA() returns (uint r) { return m_a; }
}

