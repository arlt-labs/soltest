contract test {
	function a(bytes32 input) returns (bytes32 hash) {
		var b = 65536;
		uint c = 256;
		return keccak256(8, input, b, input, c);
	}
}

