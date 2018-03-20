contract C {
	function test() returns (bytes) {
		bytes memory x = new bytes(5);
		for (uint i = 0; i < x.length; ++i)
			x[i] = byte(i + 1);
		assembly { mstore(add(x, 32), "12345678901234567890123456789012") }
		return x;
	}
}

