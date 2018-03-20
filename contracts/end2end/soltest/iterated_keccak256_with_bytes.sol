contract c {
	bytes data;
	function foo() returns (bytes32)
	{
		data.length = 3;
		data[0] = "x";
		data[1] = "y";
		data[2] = "z";
		return keccak256("b", keccak256(data), "a");
	}
}

