contract c {
	function foo() returns (bytes32 d)
	{
		d = keccak256("foo");
	}
	function bar(uint a, uint16 b) returns (bytes32 d)
	{
		d = keccak256(a, b, 145, "foo");
	}
}

