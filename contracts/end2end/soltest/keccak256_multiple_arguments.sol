contract c {
	function foo(uint a, uint b, uint c) returns (bytes32 d)
	{
		d = keccak256(a, b, c);
	}
}

