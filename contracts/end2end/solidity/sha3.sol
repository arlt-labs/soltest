contract test {
	// to confuse the optimiser
	function b(bytes32 input) returns (bytes32) {
		return sha3(input);
	}
	function a(bytes32 input) returns (bool) {
		return keccak256(input) == b(input);
	}
}

