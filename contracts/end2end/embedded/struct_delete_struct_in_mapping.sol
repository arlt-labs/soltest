/// @ext:soltest
/// {struct_delete_struct_in_mapping}
///     // compileAndRun(sourceCode, 0, "test");
///     // ABI_CHECK(callContractFunction("deleteIt()"), encodeArgs(0));
contract test {
	struct testStruct
	{
		uint m_value;
	}
	mapping (uint => testStruct) campaigns;

	function test()
	{
		campaigns[0].m_value = 2;
	}
	function deleteIt() returns (uint)
	{
		delete campaigns[0];
		return campaigns[0].m_value;
	}
}

