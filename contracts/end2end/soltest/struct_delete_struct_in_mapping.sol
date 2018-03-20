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

