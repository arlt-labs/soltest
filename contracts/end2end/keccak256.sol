contract test {
	function a(bytes32 input) returns (bytes32 hash) {
		return keccak256(input);
	}
}

