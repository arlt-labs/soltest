contract c {
	function foo(uint a, uint b, uint c) returns (bytes32 d)
	{
		d = sha3(a, b, c);
	}

}
