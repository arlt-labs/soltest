contract A {
	uint[3] arr;
	bool public test = false;
	function getElement(uint i) returns (uint)
	{
		return arr[i];
	}
	function testIt() returns (bool)
	{
		uint i = this.getElement(5);
		test = true;
		return true;
	}
}

