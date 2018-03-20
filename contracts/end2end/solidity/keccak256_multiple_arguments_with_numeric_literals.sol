contract c {
	function foo(uint a, uint16 b) returns (bytes32 d)
	{
		d = keccak256(a, b, 145);
	}
}

