contract test {
	function a(bytes32 input) returns (bytes32 sha256hash) {
		return sha256(input);
	}
}

